using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.IO;

namespace C5_SP_KR
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] specwords = { "а", "але", "однак", "проте", "а проте", "зате", "який", "яке", 
                                     "які", "так", "хоч", "хоча", "як", "тобто", "наче", "неначе" };
            String[] words;
            int[] types;
            char[] temp;
            Console.Write("Input source file name:\n");
            string str = Console.ReadLine();
            Text t = new Text("d:/test.txt");
            Console.Write("Input library file name:\n");
            str = Console.ReadLine();
            WordDictionary wd = new WordDictionary("d:/test.xml");
            LexAn la = new LexAn(t, wd);
            la.Start();
            la.WriteNodes();
            words = la.getNodes();
            types = la.getTypes();
            string[] pos = new string[types.Length];
            pos[0] = "";
            for (int i = 1; i < types.Length; i++)
            {
                for (int k = 0; k < i; k++)
                {
                    if (types[i] - 32 < 0 && types[k] == types[i] && types[i] != 0 && types[i - 1] != 1024) pos[i] = ", ";
                    else if (types[i] == 1024) pos[i] = ""; else pos[i] = " ";
                    for (int j = 0; j < specwords.Length; j++)
                    {
                        if (words[i] == specwords[j] && words[i - 1] != ".") pos[i] = ", ";
                    }
                }
            }
            temp = words[0].ToCharArray();
            temp[0] = char.ToUpper(temp[0]);
            words[0] = new string(temp);
            for (int i = 1; i < words.Length; i++)
            {
                if (words[i - 1] == ".")
                {
                    temp = words[i].ToCharArray();
                    temp[0] = char.ToUpper(temp[0]);
                    words[i] = new string(temp);
                }
            }
            for (int i = 0; i < words.Length; i++)
            {
                Console.Write(pos[i] + words[i]);
            }

            Console.ReadLine();
            /*
            WordDictionary wd = new WordDictionary();
            AttributeModifiers attrm = new AttributeModifiers();
            attrm.BaseForm = "нiч";
            {
                AttributesNoun attr = new AttributesNoun();
                attr.Case = eCase.caNominative;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuSingular;
                attrm.Add("iч", attr);
            }
            {
                AttributesNoun attr = new AttributesNoun();
                attr.Case = eCase.caDativr;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuPlural;
                attrm.Add("очi", attr);
            }
            wd.Add("н", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "така";
            {
                AttributesUnion attr = new AttributesUnion();
                attr.Kind = eKindUnion.kiUniDividing;
                attrm.Add("а", attr);
            }
            wd.Add("так", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "мiсячна";
            {
                AttributesAdjective attr = new AttributesAdjective();
                attr.Case = eCase.caNominative;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuSingular;
                attr.Comparison = eComparation.coPositive;
                attrm.Add("а", attr);
            }
            {
                AttributesAdjective attr = new AttributesAdjective();
                attr.Case = eCase.caDativr;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuPlural;
                attr.Comparison = eComparation.coPositive;
                attrm.Add("i", attr);
            }
            wd.Add("мiсячн", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "ясная";
            {
                AttributesAdjective attr = new AttributesAdjective();
                attr.Case = eCase.caNominative;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuSingular;
                attr.Comparison = eComparation.coPositive;
                attrm.Add("ая", attr);
            }
            {
                AttributesAdjective attr = new AttributesAdjective();
                attr.Case = eCase.caDativr;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuPlural;
                attr.Comparison = eComparation.coPositive;
                attrm.Add("i", attr);
            }
            wd.Add("ясн", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "зоряна";
            {
                AttributesAdjective attr = new AttributesAdjective();
                attr.Case = eCase.caNominative;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuSingular;
                attr.Comparison = eComparation.coPositive;
                attrm.Add("а", attr);
            }
            {
                AttributesAdjective attr = new AttributesAdjective();
                attr.Case = eCase.caDativr;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuPlural;
                attr.Comparison = eComparation.coPositive;
                attrm.Add("i", attr);
            }
            wd.Add("зорян", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "видно";
            {
                AttributesInterjection attr = new AttributesInterjection();
                attrm.Add("", attr);
            }
            wd.Add("видно", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "хоч";
            {
                AttributesParticle attr = new AttributesParticle();
                attrm.Add("", attr);
            }
            wd.Add("хоч", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "голка";
            {
                AttributesNoun attr = new AttributesNoun();
                attr.Case = eCase.caNominative;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuSingular;
                attrm.Add("а", attr);
            }
            {
                AttributesNoun attr = new AttributesNoun();
                attr.Case = eCase.caDativr;
                attr.Gender = eGender.geFemale;
                attr.Number = eNumber.nuPlural;
                attrm.Add("и", attr);
            }
            wd.Add("голк", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "збирати";
            {
                AttributesVerb attr = new AttributesVerb();
                attr.Inclination = eInclination.inConditional;
                attr.Time = eTime.tiPresent;
                attr.Gender = eGender.geDual;
                attr.Person = ePerson.peSecond;
                attr.Number = eNumber.nuSingular;
                attr.Form = eForm.foImperfective;
                attrm.Add("й", attr);
            }
            wd.Add("збира", attrm);
            wd.Save("d:/test.xml");     */    
        }
    }
}
