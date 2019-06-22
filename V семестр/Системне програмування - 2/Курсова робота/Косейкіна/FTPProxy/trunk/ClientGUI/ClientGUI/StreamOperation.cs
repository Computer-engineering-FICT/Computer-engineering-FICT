using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Net.Sockets;

namespace ClientGUI
{
    class StreamOperation
    {
        public static MemoryStream readBytes(NetworkStream stream)
        {
            System.Console.WriteLine("Start read");
            if (stream == null)
            {
                throw new ConnectionException(ConnectionException.INVALID_CLIENT_ADDRESS_OR_PORT_EXCEPTION);
            }
            System.Console.WriteLine("Continue read");
            int buffLength = 1024;
            byte[] array = new byte[buffLength];
            int length;
            MemoryStream ms = new MemoryStream();

            while (true)
            {
                length = stream.Read(array, 0, buffLength);
                System.Console.WriteLine("Read=" + length);
                ms.Write(array, 0, length);
                if (length < buffLength)
                {
                    break;
                }
            }
            return ms;
        }

        public static void writeBytes(NetworkStream stream, MemoryStream ms)
        {
            if (stream == null || ms == null)
            {
                throw new ConnectionException(ConnectionException.INVALID_CLIENT_ADDRESS_OR_PORT_EXCEPTION);
            }
            System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            int buffLength = 1024;
            byte[] array = new byte[buffLength];
            int length;
            ms.Seek(0, SeekOrigin.Begin);
            while (true)
            {
                length = ms.Read(array, 0, buffLength);
                stream.Write(array, 0, length);
                if (length < buffLength)
                {
                    break;
                }
            }
        }

        public static void writeString(NetworkStream stream, String line)
        {
            if (stream == null || line == null)
            {
                throw new ConnectionException(ConnectionException.INVALID_CLIENT_ADDRESS_OR_PORT_EXCEPTION);
            }
            System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            byte[] array = encoding.GetBytes(line);
            stream.Write(array, 0, array.Length);
        }

        public static String readString(NetworkStream stream)
        {
            if (stream == null)
            {
                throw new ConnectionException(ConnectionException.INVALID_CLIENT_ADDRESS_OR_PORT_EXCEPTION);
            }
            int buffLength = 1024;
            byte[] buff = new byte[buffLength];
            int length = -1;
            int sumLength = 0;
            List<byte[]> list = new List<byte[]>();
            List<int> sizes = new List<int>();
            while (true)
            {
                length = stream.Read(buff, 0, buffLength);
                list.Add(buff);
                sumLength += length;
                sizes.Add(length);
                if (length < buffLength)
                {
                    break;
                }
            }
            byte[] resArr = new byte[sumLength];
            int n = 0;
            for (int i = 0; i < list.Count; i++)
            {
                for (int j = 0; j < sizes.ElementAt(i); j++)
                {
                    resArr[n] = list.ElementAt(i)[j];
                    n++;
                }
            }
            string str = System.Text.Encoding.ASCII.GetString(resArr, 0, resArr.Length);
            return str;
        }
    }
}
