using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Collections;
using System.Threading;
using System.IO;

namespace FTPProxyServer
{
    public class TCPServerToFTP
    {
        public int portTcp;
        public List<Client> clients;
        public TcpListener tcpListener;
        public List<int> busyPorts;

        public TCPServerToFTP(int portTcp1)
        {
            if (portTcp1 < 0)
            {
                throw new ConnectionException(ConnectionException.INVALID_CLIENT_ADDRESS_OR_PORT_EXCEPTION);
            }
            portTcp = portTcp1;
            clients = new List<Client>();
            busyPorts = new List<int>();
            busyPorts.Add(portTcp);
        }

        public int generateFreePort()
        {
            if (busyPorts.Count > 65535)
            {
                return -1;
            }
            while (true)
            {
                Random r = new Random();
                int p = r.Next(65534);
                if (p % 2 == 1)
                {
                    continue;
                }
                for (int i = 0; i < busyPorts.Count; i++)
                {
                    if (p == busyPorts.ElementAt(i))
                    {
                        continue;
                    }
                }
                if (p < 500)
                {
                    continue;
                }
                return p;
            }
        }

        public void takeConnection()
        {
            System.Console.WriteLine("Start server on port=" + portTcp);
            tcpListener = new TcpListener(IPAddress.Any, portTcp);
            tcpListener.Start();
            while (true)
            {
                try
                {
                    System.Console.WriteLine("Wait for new client");
                    TcpClient clientTcp = tcpListener.AcceptTcpClient();
                //    System.Console.WriteLine("Accept new client");
                    int newPort = generateFreePort();
                    if (newPort == -1)
                    {
                        clientTcp.Close();
                        continue;
                    }
                    StreamOperation.writeString(clientTcp.GetStream(), newPort.ToString());
                  //  System.Console.WriteLine("Send string to client");
                    String val = clientTcp.Client.RemoteEndPoint.ToString();
                    String ip = val.Substring(0, val.IndexOf(':'));
                    String port = val.Substring(val.IndexOf(':') + 1, val.Length - val.IndexOf(':') - 1);
                    System.Console.WriteLine("Connect new client ip=" + ip + " port=" + newPort);
                    Client client = new Client(newPort, newPort + 1, ip, this);
                    clients.Add(client);
                    Thread threadForClient = new Thread(new ThreadStart(client.waitForConnection));
                    threadForClient.Start();

                }
                catch (Exception ex)
                {
                    System.Console.WriteLine("Exception " + ex.ToString());
                }
            }
        }

    }
}
