using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Net;
using System.IO;
using System.Xml.Serialization;
using System.Xml;
using System.Threading;

namespace ClientGUI
{
    public class TCPClientToFTP
    {
        public const String resultString = "Succesfull";//
        public static String registerString = "RegisterMe";//
        public static String createFolderString = "CreateFolder";//delimiter folderName
        public static String deleteFolderString = "DeleteFolder";//delimiter folderName
        public static String deleteFileString = "DeleteFile";//delimiter fileName
        public static String renameFileString = "RenameFile";//delimiter oldName delimiter newName
        public static String downloadFileString = "DownloadFile";//delimiter fileName
        public static String uploadFileString = "UploadFile";//delimiter fileName
        public static String connectString = "Connect";//delimiter serverAddress delimiter login delimiter password
        public static String delimiter = "@#@";
        public static String pingQuery_str = "Ping query";
        public static String getTree_str = "Get tree";
        public static String pingAnswer_str = "Ping answer";
        public String ftpAddress;
        public String login;
        public String password;
        public const int bufferLength = 1024;
        public String ipAddress;
        public int portTcp;
        public int portTree;
        public TcpClient tcpClient;
        public TcpClient tcpClientTree;
        public Logger logger;
        public MainWindow mainWindow;
        public TCPClientToFTP(String ipAddress1, int portTcp1,String ftpAddress1,String login1,String password1,Logger logger1)
        {
            if (ftpAddress1==null|| ipAddress1 == null || portTcp1 < 0 || login1==null || password1==null)
            {
                throw new ClientException(ClientException.INVALID_SERVER_ADDRESS_OR_PORT_EXCEPTION);
            }
            ftpAddress = ftpAddress1;
            login = login1;
            password = password1;
            logger = logger1;
            ipAddress = ipAddress1;
            portTcp = portTcp1;

        }

        public void connect()
        {
            System.Console.WriteLine("Start connection on port=" + portTcp);
            tcpClient = new TcpClient();
            tcpClient.Connect(new IPEndPoint(IPAddress.Parse(ipAddress), portTcp));
            System.Console.WriteLine("Have connect");
            String answ = StreamOperation.readString(tcpClient.GetStream());
            System.Console.WriteLine("New port=" + answ);
            portTcp = int.Parse(answ);
            tcpClient.Close();
            tcpClient = new TcpClient();
            tcpClient.Connect(new IPEndPoint(IPAddress.Parse(ipAddress), portTcp));
            Thread treeReceiveThread = new Thread(new ThreadStart(this.receiveTree));
            treeReceiveThread.Start();
            connectToFtp();
        }

        public void sendLine(String command)
        {
            try
            {
                System.Console.WriteLine("Send message=" + command);
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                byte[] array = encoding.GetBytes(command);
                tcpClient.GetStream().Write(array, 0, array.Length);
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex);
                logger.addMessage(ClientException.invalid_server_address_or_port_message);
            }
        }


        public bool receiveAnswer()
        {
            try
            {
                String answer = StreamOperation.readString(tcpClient.GetStream());
                System.Console.WriteLine("answer=" + answer);
                if (answer.Equals(resultString))
                {
                    //logger.addMessage("Receive answer from server=" + answer);
                    return true;
                }
                else
                {
                    throw new Exception();
                }
            }
            catch (Exception e)
            {
                System.Console.WriteLine(e);
                logger.addMessage(ClientException.invalid_received_message);
                return false;
            }
        }

        public bool sendAnswerOnPing()
        {
            sendLine(pingAnswer_str);
           // logger.addMessage("Send answer on ping to server");
            return receiveAnswer();
        }


        public bool createFolder(String folderName)
        {
            sendLine(createFolderString + delimiter + folderName);
            //logger.addMessage("Create folder folderName="+folderName);
            return receiveAnswer();
        }

        public bool deleteFolder(String folderName)
        {
            sendLine(deleteFolderString + delimiter + folderName);
            return receiveAnswer();
        }

        public bool deleteFile(String fileName)
        {
            sendLine(deleteFileString + delimiter + fileName);
            //logger.addMessage("Delete file fileName=" + fileName);
            return receiveAnswer();
        }

        public bool renameFile(String oldName, String newName)
        {
            sendLine(renameFileString + delimiter + oldName + delimiter + newName);
            //logger.addMessage("Rename file lastFileName=" + oldName+" next fileName="+newName);
            return receiveAnswer();
        }

        public List<byte[]> downloadFile(String filename, String fileDestination)
        {
            sendLine(downloadFileString + delimiter + filename);
            List<byte[]> byteList = new List<byte[]>();
            int buffLength = 1024;
            
            int length;
            try
            {
                FileStream fileOut = new FileStream(fileDestination, FileMode.Create, FileAccess.Write);
                while (true)
                {
                    byte[] buff = new byte[buffLength];
                    length = tcpClient.GetStream().Read(buff, 0, buffLength);
                    byteList.Add(buff);
                    fileOut.Write(buff, 0, length);

                    if (length < buffLength)
                    {
                        break;
                    }
                }
                fileOut.Close();
                //logger.addMessage("Download file fileName=" + fileDestination);
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex);
                logger.addMessage("Exception in downloading file fileName=" + fileDestination);
            }
            
            receiveAnswer();
            return byteList;
        }

        public void uploadFile(String filename, String fileDestination)
        {
            sendLine(uploadFileString + delimiter + fileDestination);

            System.Console.WriteLine("Start send file");
            
            try
            {
                FileStream fileIn = new FileStream(filename, FileMode.Open, FileAccess.Read);
                int length;
                int buffLength = 1024;
                byte[] buff = new byte[buffLength];
                int n = 0;
                while (true)
                {
                    System.Console.WriteLine("next buff=" + n);
                    n++;
                    length = fileIn.Read(buff, 0, buffLength);
                    if (length != 0)
                    {
                        tcpClient.GetStream().Write(buff, 0, length);
                    }
                    else
                    {
                        break;
                    }
                }
                fileIn.Close();
            }
            catch (Exception ex)
            {
                System.Console.WriteLine("Exception in uploading");
                System.Console.WriteLine(ex);
            }
           

            receiveAnswer();
        }


        public bool connectToFtp()
        {
            sendLine(connectString + delimiter + ftpAddress + delimiter + login + delimiter + password);
            //logger.addMessage("Connect to ftp with address="+ftpAddress+" login="+login+" password="+password);
            return receiveAnswer();
        }

        public void receiveTree()
        {
            if (tcpClientTree == null)
            {
                System.Console.WriteLine("Port for tree=" + (portTcp + 1));
                TcpListener listener = new TcpListener(new IPEndPoint(IPAddress.Parse(ipAddress), portTcp + 1));
                listener.Start();
                tcpClientTree = listener.AcceptTcpClient();
            }
            try
            {
              
                
                
            while (true)
            {
                System.Console.WriteLine("Receive tree from port=" + portTcp);
                MemoryStream ms = StreamOperation.readBytes(tcpClientTree.GetStream());
                ms.Seek(0, SeekOrigin.Begin);
                System.Console.WriteLine("have receive tree");
                List<Node> nodeList = new List<Node>();
                XmlSerializer serializer = new XmlSerializer(nodeList.GetType());
                XmlReader reader = new XmlTextReader(ms);
                nodeList = (List<Node>)serializer.Deserialize(reader);

                for (int i = 0; i < nodeList.Count - 1; i++)
                {
                    for (int j = 0; j < nodeList.ElementAt(i).foldersNames.Count; j++)
                    {
                        if (nodeList.ElementAt(i).foldersNames.ElementAt(j).Length == 0)
                        {
                            nodeList.ElementAt(i).foldersNames.Remove("");
                        }
                    }
                    for (int j = 0; j < nodeList.ElementAt(i).files.Count; j++)
                    {
                        if (nodeList.ElementAt(i).files.ElementAt(j).Length == 0)
                        {
                            nodeList.ElementAt(i).files.Remove("");
                        }
                    }
                }
                System.Console.WriteLine("Have build tree");
                Node head = nodeList.ElementAt(nodeList.Count - 1);
                head.buildChild(nodeList);

                mainWindow.setTree(head);
                System.Console.WriteLine("Have set tree");
            }
                }
                catch (Exception e)
                {
                    System.Console.WriteLine(e);
                    logger.addMessage("Exception in receiving tree");
                }
            }


    }
}
