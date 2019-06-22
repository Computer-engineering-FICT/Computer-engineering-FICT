using System;
using System.Collections.Generic;
using System.Linq;

namespace C5_SP_KR
{
    class LexAn
    {
        public const int spSpace = 0, spNewLine = 1, spPoint = 2, spComma = 3, spExclamation = 4,
                         spQuestion = 5, spColon = 6, spDash = 7, spSemicolon = 8;
        Text inText;
        char ch;
        NodeStruct[] nodes = new NodeStruct[0];
        NodeStruct ndStr;
        WordDictionary dict;
        char[] Separators = { ' ', '\n', '.', ',', '!', '?', ':', '-', ';' };
        public LexAn(Text t, WordDictionary ind)
        {
            inText=t;
            ch = inText.getNext();
            ch = inText.getNext();
            dict = ind;
        }
        string GetLexem()
        {
            string token = "";
            ndStr = new NodeStruct();
            ndStr.X = inText.getX() - 1;
            if (ch=='\0')
                return null;
            bool b=false;
            while (!b)
            {
                b = false;
                for (int i = 0; i < Separators.Length; i++)
                {
                    b |= ch == Separators[i];
                }
                if (!b)
                {
                    token = token + ch;
                    ch = inText.getNext();
                }
            }
            if (b && token == "")
            {
                b = false;
                ndStr.Type = NodeStruct.tySep;
                token = token + ch;
                ch = inText.getNext();
                if (ch=='\0')
                    if (token=="")
                        return null;
                    else
                        return token;
                while (!b)
                {
                    b = false;
                    for (int i = 0; i < spPoint; i++)
                    {
                        b |= ch == Separators[i];
                    }
                    if (!b)
                    {
                        token = token + ch;
                        ch = inText.getNext();
                    }
                }
            }
            while (ch == Separators[spSpace] || ch == Separators[spNewLine])
            {
                ch = inText.getNext();
            }
            return token;
        }
        void DetermineType(String token)
        {
            KeyValuePair<String, Attributes> elem = dict.findFirst(token);
            while (elem.Key != null)
            {
                ndStr.Type = ndStr.Type | elem.Value.getWordType();
                Attributes[] tmp = (Attributes[])Array.CreateInstance(elem.Value.GetType(),ndStr.Attr.Length+1);
                ndStr.Attr.CopyTo(tmp, 0);
                tmp[tmp.Length - 1] = elem.Value;
                ndStr.Attr = tmp;
                elem = dict.findNext();
            }
        }
        public void Start()
        {
            String token;
            token = GetLexem();
            while (token != null)
            {
                token = token.ToLower();
                DetermineType(token);
                NodeStruct[] tmp = (NodeStruct[])Array.CreateInstance(ndStr.GetType(), nodes.Length + 1);
                nodes.CopyTo(tmp, 0);
                tmp[tmp.Length - 1] = ndStr;
                ndStr.Word = token;
                nodes = tmp;
                token = GetLexem();
            }
        }
        public void WriteNodes()
        {
            for (int i = 0; i < nodes.Length; i++)
            {
                Console.WriteLine("Position="+nodes[i].X);
                Console.WriteLine("Lexem=" + nodes[i].Word);
                if (nodes[i].Type == NodeStruct.tySep)
                {
                    Console.WriteLine("Type="+NodeStruct.tySep);
                }
                for (int k = 0; k < nodes[i].Attr.Length; k++)
                {
                    Console.WriteLine("BaseForm=" + nodes[i].Attr[k].BaseForm);
                    Console.WriteLine(nodes[i].Attr[k].toString());
                }
                Console.WriteLine();
            }
        }
    }
}
