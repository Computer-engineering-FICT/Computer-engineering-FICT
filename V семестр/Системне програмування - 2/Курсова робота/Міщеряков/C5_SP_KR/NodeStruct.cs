using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace C5_SP_KR
{
    class NodeStruct
    {
        public const int tyNull = 0;
        public const int tyNou = 1, tiNou = 0;//noun - существительное
        public const int tyAdj = 2, tiAdj = 1;//adjective - прилагательное
        public const int tyNum = 4, tiNum = 2;//numeral - числительное
        public const int tyPro = 8, tiPro = 3;//pronoun - местоимение
        public const int tyVer = 16, tiVer = 4;//verb - глагол
        public const int tyAdv = 32, tiAdv = 5;//adverb - наречие
        public const int tyPre = 64, tiPre = 6;//preposition - предлог
        public const int tyUni = 128, tiUni = 7;//union - союз
        public const int tyPar = 256, tiPar = 8;//particle - частица
        public const int tyInt = 512, tiInt = 9;//interjection - междометие
        public const int tySep = 1024;//separators
        public long X;
//        public int Y;
//        public int File;
        public int Type;
        public int Index;
        public string Word;
        public Attributes[] Attr = new Attributes[0];
    }
}
