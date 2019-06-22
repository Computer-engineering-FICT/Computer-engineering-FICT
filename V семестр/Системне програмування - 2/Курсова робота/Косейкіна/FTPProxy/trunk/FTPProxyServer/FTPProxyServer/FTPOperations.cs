using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Net.Sockets;
using System.Threading;

namespace FTPProxyServer
{
    public class FTPOperations
    {
        private String endCMD = "\r\n";
        private String userCMD = "USER ";
        private String passCMD = "PASS ";
        private String pasvCMD = "PASV ";
        private String portCMD = "PORT ";
        private String listCMD = "LIST ";
        private String mkdCMD = "MKD ";
        private String rmdCMD = "RMD ";
        private String deleCMD = "DELE ";
        private String rnfrCMD = "RNFR ";
        private String rntoCMD = "RNTO ";
        private String retrCMD = "RETR ";
        private String storCMD = "STOR ";
        private int commandPort=21;
        private String ftpServerIP;
        private String user;
        private String password;
        private TcpClient commandForFTP;
        private TcpClient dataForFTP;
        private int p = 1;
        private int p1 = 1;
        private TcpListener listener;
        public FTPOperations(String ftpServerIP1, String user1, String password1)
        {
            ftpServerIP = ftpServerIP1;
            user = user1;
            password = password1;
            connectToServer();
            p1 = Program.portNumberForFTP;
            Program.portNumberForFTP += 10;
        }

        public bool connectToServer()
        {
            Tuple<bool, String> error;
            commandForFTP = new TcpClient();
            commandForFTP.Connect(new IPEndPoint(IPAddress.Parse(ftpServerIP), commandPort));
            String answ = StreamOperation.readString(commandForFTP.GetStream());
            while (answ.IndexOf("http") < 0)
            {
                answ = StreamOperation.readString(commandForFTP.GetStream());
            }
            
            error = isError(answ);
            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return false;
            }
            
            StreamOperation.writeString(commandForFTP.GetStream(), userCMD + user + endCMD);
            answ = StreamOperation.readString(commandForFTP.GetStream());
            error = isError(answ);
            if (error.Item1)
            {
                return false;
            }
            
            StreamOperation.writeString(commandForFTP.GetStream(), passCMD + password + endCMD);
            answ = StreamOperation.readString(commandForFTP.GetStream());
            error = isError(answ);
            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return false;
            }
            
            

            return true;
        }

        public void sendPasv()
        {
            StreamOperation.writeString(commandForFTP.GetStream(), portCMD + ftpServerIP+"."+p1.ToString()+"."+p.ToString() + endCMD);
            String answ = StreamOperation.readString(commandForFTP.GetStream());
            Tuple<bool,String> error = isError(answ);
            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return;
            }
        }

        public void connectToData()
        {
            if (listener != null)
            {
                listener.Stop();
                dataForFTP.Close();
            }
                listener = new TcpListener(IPAddress.Any, 256*p1+p);
                p++;
                //System.Console.WriteLine("Port for FTP=" + (256 * p1 + p));
                if (p > 99)
                {
                    p = 0;
                    p1++;
                }
                listener.Start();
            
            dataForFTP = listener.AcceptTcpClient();
                        
        }

        public List<Tuple<String,bool>> getFileList(String folder)
        {
            sendPasv();
            StreamOperation.writeString(commandForFTP.GetStream(), listCMD + folder + endCMD);
            
            connectToData();
            
            String filesLine= StreamOperation.readString(dataForFTP.GetStream());
            String answ = StreamOperation.readString(commandForFTP.GetStream());
            Tuple<bool,String> error = isError(answ);
            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                throw new FTPExceptions(FTPExceptions.INVALID_FILE_LIST_EXCEPTION);
            }
            if (filesLine == null)
            {
                return null;
            }
            if (filesLine.Length==0)
            {
                return null;
            }
            List<Tuple<String,bool>> files = new List<Tuple<String,bool>>();
            int endP;
            Tuple<String, bool> ct;
            while (true)
            {
                endP=filesLine.IndexOf(endCMD);
                
                if(endP<=0)
                {
                    break;
                }
                String fileName = filesLine.Substring(0, endP);
                bool isDirectory=false;
                if (fileName.ElementAt(0) == 'd')
                {
                    isDirectory = true;
                }
                files.Add(new Tuple<String,bool>(fileName.Substring(fileName.LastIndexOf(' ')+1,fileName.Length-fileName.LastIndexOf(' ')-1),isDirectory));
                filesLine = filesLine.Substring(endP+endCMD.Length, filesLine.Length - endP-endCMD.Length);
                
            }
            return files;
        }

        public bool createFolder(String folderName)
        {
            StreamOperation.writeString(commandForFTP.GetStream(), mkdCMD+folderName+ endCMD);
            String answ = StreamOperation.readString(commandForFTP.GetStream());
            Tuple<bool,String> error = isError(answ);

            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return false;
            }
            return true;
        }

        public bool deleteFolder(String folderName)
        {
            StreamOperation.writeString(commandForFTP.GetStream(), rmdCMD + folderName + endCMD);
            String answ = StreamOperation.readString(commandForFTP.GetStream());
            Tuple<bool, String> error = isError(answ);

            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return false;
            }
            return true;
        }

        public bool deleteFile(String fileName)
        {
            StreamOperation.writeString(commandForFTP.GetStream(), deleCMD + fileName + endCMD);
            String answ = StreamOperation.readString(commandForFTP.GetStream());
            Tuple<bool, String> error = isError(answ);

            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return false;
            }
            return true;
        }

        public bool renameFile(String fileOldName,String fileNewName)
        {
            StreamOperation.writeString(commandForFTP.GetStream(), rnfrCMD + fileOldName + endCMD);
            String answ = StreamOperation.readString(commandForFTP.GetStream());
            Tuple<bool, String> error = isError(answ);

            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return false;
            }

            StreamOperation.writeString(commandForFTP.GetStream(), rntoCMD + fileNewName + endCMD);
            answ = StreamOperation.readString(commandForFTP.GetStream());
            error = isError(answ);

            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return false;
            }

            return true;
        }

        public Tuple<bool, String> isError(String answer)
        {
            try{
                int number = int.Parse(answer.Substring(0, 1));
                if (number!= 4 || number!=5)
                {
                    return new Tuple<bool, string>(false, null);
                }
                else
                {
                    return new Tuple<bool, string>(true, answer.Substring(3, answer.Length - 3));
                }
            }catch(Exception e){
                return new Tuple<bool, string>(true, "unidentifier error");
            }
        }

        public MemoryStream downloadFile(String fileName)
        {
            sendPasv();
            StreamOperation.writeString(commandForFTP.GetStream(), retrCMD + fileName + endCMD);

            connectToData();

            String answ = StreamOperation.readString(commandForFTP.GetStream());
            Tuple<bool, String> error = isError(answ);

            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return null;
            }
            MemoryStream ms=StreamOperation.readBytes(dataForFTP.GetStream());
            
            return ms;
        }

        public bool uploadFile(MemoryStream ms, String fileName)
        {
            sendPasv();
            StreamOperation.writeString(commandForFTP.GetStream(), storCMD + fileName + endCMD);
            connectToData();
            StreamOperation.writeBytes(dataForFTP.GetStream(), ms);
            String answ = StreamOperation.readString(commandForFTP.GetStream());
            Tuple<bool, String> error = isError(answ);

            if (error.Item1)
            {
                System.Console.WriteLine("Error " + error.Item2);
                return false;
            }
            return true;
        }
        

        
      
        
        public Node buildNodeFromFolder(String folderName)
        {
            if (folderName == null)
            {
                throw new ArgumentNullException();
            }
            Node node = new Node();
            node.name = folderName;
            List<Tuple<String,bool>> currentFolder = getFileList(folderName);
            if (currentFolder == null)
            {
                return node;
            }
            Tuple<String, bool> currTup;
            for (int i = 0; i < currentFolder.Count; i++)
            {
                currTup = currentFolder.ElementAt(i);
                if (currTup.Item2)
                {
                    node.addFolder(buildNodeFromFolder(folderName+"\\"+currTup.Item1));
                    
                }
                else
                {
                    node.addFile(currTup.Item1);
                }
            }
            return node;
        }

        public MemoryStream buildTree()
        {
            MemoryStream ms=null;
            try
            {
                Node head = buildNodeFromFolder("");
                List<Node> nodes = new List<Node>();

                nodes = head.getList();
                nodes.Add(head);
                System.Console.WriteLine("Have build, start serialize");
                System.Xml.Serialization.XmlSerializer serializer = new System.Xml.Serialization.XmlSerializer(nodes.GetType());
                
                ms = new MemoryStream();
                serializer.Serialize(ms, nodes);
                System.Console.WriteLine("Have serizalize");
            }
            catch (Exception ex)
            {
                System.Console.WriteLine("Exception e"+ex.ToString());
                throw new FTPExceptions(FTPExceptions.INVALID_BUILDING_AND_SERIALIZING_TREE_EXCEPTION);
            }
            return ms;
        }       
    }
}