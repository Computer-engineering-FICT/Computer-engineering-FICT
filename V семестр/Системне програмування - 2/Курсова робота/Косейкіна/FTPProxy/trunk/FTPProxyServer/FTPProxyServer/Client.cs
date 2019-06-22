using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.IO;

namespace FTPProxyServer
{
    public class Client
    {

        public const String resultString = "Succesfull";//
        public const String createFolderString = "CreateFolder";//delimiter folderName
        public const String deleteFolderString = "DeleteFolder";//delimiter folderName
        public const String deleteFileString = "DeleteFile";//delimiter fileName
        public const String downloadFileString = "DownloadFile";//delimiter fileName
        public const String uploadFileString = "UploadFile";//delimiter fileName
        public const String renameFileString = "RenameFile";//delimiter oldName delimiter newName
        public const String connectString = "Connect";//delimiter serverAddress delimiter login delimiter password
        public const String delimiter = "@#@";
        public const int buffLength = 1024;
        public FTPOperations operations;
        public TcpClient clientTcp;
        public TcpClient clientTree;
        public int tcpPort;
        public int treePort;
        public String clientIp;
        public bool isConnected;
        public TCPServerToFTP tcpServerToFTP;
        public bool isConnectToFTP;

        public Client(int port, int treePort1, String clientIP1, TCPServerToFTP tcpServerToFTP1)
        {
            if (clientIP1 == null)
            {
                throw new ConnectionException(ConnectionException.INVALID_CLIENT_ADDRESS_OR_PORT_EXCEPTION);
            }
            tcpPort = port;
            treePort = treePort1;
            isConnected = false;
            clientIp = clientIP1;
            tcpServerToFTP = tcpServerToFTP1;
            isConnectToFTP = false;
        }

        public void waitForConnection()
        {
            TcpListener listener = new TcpListener(new IPEndPoint(IPAddress.Any, tcpPort));
            listener.Start();
            clientTcp = listener.AcceptTcpClient();
            isConnected = true;
            receive();
        }

        public void callSendTree()
        {
            lock (tcpServerToFTP.clients)
            {
                for (int i = 0; i < tcpServerToFTP.clients.Count; i++)
                {
                    System.Console.WriteLine("Start spoke to send tree="+i);
                    tcpServerToFTP.clients.ElementAt(i).sendTree();
                }
            }
        }



        public void sendResultOfOperation(String line)
        {
            try
            {
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                byte[] array = encoding.GetBytes(line);
                clientTcp.GetStream().Write(array, 0, array.Length);
            }
            catch (Exception ex)
            {
                System.Console.WriteLine("Exception in sending result");
            }
        }


        public void renameFile(String informationPart)
        {
            String oldName = informationPart.Substring(0, informationPart.IndexOf(delimiter));
            informationPart = informationPart.Substring(informationPart.IndexOf(delimiter) + delimiter.Length, informationPart.Length - informationPart.IndexOf(delimiter) - delimiter.Length);
            operations.renameFile(oldName, informationPart);
            System.Console.WriteLine("Rename succesfull");
        }

        public void downloadingFile(String informationPart)
        {
            MemoryStream file = operations.downloadFile(informationPart);
            StreamOperation.writeBytes(clientTcp.GetStream(), file);
            file.Close();
            System.Console.WriteLine("Download succesfull");
        }

        public void uploadingFile(String informationPart)
        {
            MemoryStream ms = new MemoryStream();
            ms = StreamOperation.readBytes(clientTcp.GetStream());
            operations.uploadFile(ms, informationPart);
            ms.Close();
            System.Console.WriteLine("Uploads succesfull");
        }

        public void connect(String informationPart)
        {
         //   System.Console.WriteLine("Start connect client");
            String ftpAddr = informationPart.Substring(0, informationPart.IndexOf(delimiter));
            informationPart = informationPart.Substring(informationPart.IndexOf(delimiter) + delimiter.Length, informationPart.Length - informationPart.IndexOf(delimiter) - delimiter.Length);
            String login = informationPart.Substring(0, informationPart.IndexOf(delimiter));
            informationPart = informationPart.Substring(informationPart.IndexOf(delimiter) + delimiter.Length, informationPart.Length - informationPart.IndexOf(delimiter) - delimiter.Length);
            String password = informationPart;
          //  System.Console.WriteLine("Start connect to ftp");
            operations = new FTPOperations(ftpAddr, login, password);
         //   System.Console.WriteLine("End connect to ftp");
            isConnectToFTP = true;
            sendResultOfOperation(resultString);
         //   System.Console.WriteLine("Start send tree");
            sendTree();
            System.Console.WriteLine("Connection succesfull");
        }
        public void operate(String operatePart, String informationPart)
        {
            if (operatePart == null)
            {
                return;
            }
            if (!isConnectToFTP && operatePart.Equals(connectString))
            {
                connect(informationPart);
                return;
            }
            try
            {
                if (operations == null)
                {
                    sendResultOfOperation(FTPExceptions.invalid_FTP_connection_message);
                    return;
                }
                switch (operatePart)
                {
                    case createFolderString: { operations.createFolder(informationPart); System.Console.WriteLine("Create folder succesfull"); callSendTree(); break; };
                    case renameFileString: { renameFile(informationPart); System.Console.WriteLine("Rename file succesfull"); callSendTree(); break; };
                    case deleteFolderString: { operations.deleteFolder(informationPart); System.Console.WriteLine("Delete folder succesfull"); callSendTree(); break; };
                    case deleteFileString: { operations.deleteFile(informationPart); System.Console.WriteLine("Delete file succesfull"); callSendTree(); break; };
                    case downloadFileString: { downloadingFile(informationPart); break; };
                    case uploadFileString: { uploadingFile(informationPart); callSendTree(); break; };
                }
                sendResultOfOperation(resultString);
            }
            catch (FTPExceptions ex)
            {
                sendResultOfOperation(ex.getMessage());
            }
            catch (Exception e)
            {
                sendResultOfOperation(FTPExceptions.undefined_exception);
            }

        }

        public void receive()
        {
            while (true)
            {
                try
                {
                    if (!clientTcp.Connected)
                    {
                        //continue;
                        System.Console.WriteLine("Break1");
                        break;
                    }
                    string str = StreamOperation.readString(clientTcp.GetStream());
                    if (str.Length == 0)
                    {
                        System.Console.WriteLine("Break2");
                        break;
                    }
                    System.Console.WriteLine("Receive string=" + str+" from client="+clientIp);
                    if (str.Equals(""))
                    {
                        continue;
                    }
                    if (str.Length == 0)
                    {
                        continue;
                    }

                    String operatePart = str.Substring(0, str.IndexOf(delimiter));
                    String informationPart = str.Substring(str.IndexOf(delimiter) + delimiter.Length, str.Length - str.IndexOf(delimiter) - delimiter.Length);
                    operate(operatePart, informationPart);

                }
                catch (Exception e)
                {
                    sendResultOfOperation(ConnectionException.INVALID_CLIENT_MESSAGE_MESSAGE);
                }
            }
        }

        public void sendTree()
        {
            //System.Console.WriteLine("Start method send tree");
            if (clientTree == null)
            {
              //  System.Console.WriteLine("Create tree connect on port="+treePort);
                clientTree = new TcpClient();
                clientTree.Connect(new IPEndPoint(IPAddress.Parse(clientIp), treePort));
                //System.Console.WriteLine("End create connect");
            }
            MemoryStream ms = new MemoryStream();
            //System.Console.WriteLine("Start build tree");
            ms = operations.buildTree();
            //System.Console.WriteLine("Have build tree");
            StreamOperation.writeBytes(clientTree.GetStream(), ms);
            System.Console.WriteLine("Have send tree to client" + clientIp + " on port=" + treePort);
        }
    }
}
