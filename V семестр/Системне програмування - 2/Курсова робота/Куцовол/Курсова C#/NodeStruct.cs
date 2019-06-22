using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace C5_SP_KR
{
    class NodeStruct
    {
        public const int tyNull = 0;
        public const int tyNou = 1, tiNou = 0;//noun - іменник
        public const int tyAdj = 2, tiAdj = 1;//adjective - прикметник
        public const int tyNum = 4, tiNum = 2;//numeral - числівник
        public const int tyPro = 8, tiPro = 3;//pronoun - займенник
        public const int tyVer = 16, tiVer = 4;//verb - дієслово
        public const int tyAdv = 32, tiAdv = 5;//adverb - прислівник
        public const int tyPre = 64, tiPre = 6;//preposition - прийменник
        public const int tyUni = 128, tiUni = 7;//union - сполучник
        public const int tyPar = 256, tiPar = 8;//particle - частка
        public const int tyInt = 512, tiInt = 9;//interjection - вигук
        public const int tySep = 1024;//separators - пунктуація
        public int Type;
        public int Index;
        public string Word;
        public Attributes[] Attr = new Attributes[0];
    }
}
