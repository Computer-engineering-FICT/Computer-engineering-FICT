using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace FTPProxyServer
{
    class Program
    {
        public static int portNumberForFTP=1;
        static void Main(string[] args)
        {
            //FTPOperations op = new FTPOperations("127.0.0.1", "root", "1993");
            /*for (int i = 0; i < 11; i++)
            {
                op.getFileList("\\100");
            }*/
            //op.buildTree();
            TCPServerToFTP tcpServer = new TCPServerToFTP(10);
            tcpServer.takeConnection();
            String a;
            a = System.Console.ReadLine();
        }
    }
}
