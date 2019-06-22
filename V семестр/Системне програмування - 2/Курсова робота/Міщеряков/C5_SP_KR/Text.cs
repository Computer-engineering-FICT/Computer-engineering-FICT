using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace C5_SP_KR
{
    class Text
    {
        FileStream f;
        public Text(String file)
        {
            string fullPath = Path.GetFullPath(file);
            f = new FileStream(fullPath,FileMode.Open,FileAccess.Read);
            
        }
        public char getNext()
        {
            if (f.Length > f.Position)
                return (char)(f.ReadByte()+(f.ReadByte()<<8));
            else
                return '\0';
        }
        public long getX()
        {
            return f.Position/2-1;
        }
    }
}
