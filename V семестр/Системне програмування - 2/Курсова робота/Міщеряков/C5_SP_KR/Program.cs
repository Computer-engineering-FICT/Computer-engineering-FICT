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
            Console.Write("Input source file name:");
            string str = Console.ReadLine();
            Text t = new Text(str);
            Console.Write("Input library file name:");
            str = Console.ReadLine();
            WordDictionary wd = new WordDictionary(str);
            LexAn la = new LexAn(t, wd);
            la.Start();
            la.WriteNodes();
            Console.ReadLine();

/*            WordDictionary wd = new WordDictionary();
            AttributeModifiers attrm = new AttributeModifiers();
            attrm.BaseForm = "мост";
            {
                AttributesNoun attr = new AttributesNoun();
                attr.Case = eCase.caNominative;
                attr.Gender = eGender.geMale;
                attr.Number = eNumber.nuSingular;
                attrm.Add("", attr);
            }
            {
                AttributesNoun attr = new AttributesNoun();
                attr.Case = eCase.caGenitive;
                attr.Gender = eGender.geMale;
                attr.Number = eNumber.nuSingular;
                attrm.Add("а", attr);
            }
            wd.Add("мост", attrm);

            attrm = new AttributeModifiers();
            attrm.BaseForm = "привет";
            {
                AttributesInterjection attr = new AttributesInterjection();
                attrm.Add("", attr);
            }
            wd.Add("привет", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "мир";
            {
                AttributesNoun attr = new AttributesNoun();
                attr.Case = eCase.caNominative;
                attr.Gender = eGender.geMale;
                attr.Number = eNumber.nuSingular;
                attrm.Add("", attr);
            }
            wd.Add("мир", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "я";
            {
                AttributesPronoun attr = new AttributesPronoun();
                attr.Person = ePerson.peFirst;
                attr.Number = eNumber.nuSingular;
                attr.Case = eCase.caNominative;
                attr.Kind = eKindPronoun.kiProPersonal;
                attrm.Add("я", attr);
            }
            {
                AttributesPronoun attr = new AttributesPronoun();
                attr.Person = ePerson.peFirst;
                attr.Number = eNumber.nuSingular;
                attr.Case = eCase.caDativr;
                attr.Kind = eKindPronoun.kiProPersonal;
                attrm.Add("мне", attr);
            }
            wd.Add("", attrm);
            attrm = new AttributeModifiers();
            attrm.BaseForm = "здесь";
            {
                AttributesAdverb attr = new AttributesAdverb();
                attr.Comparison = eComparation.coNull;
                attr.Kind = eKindAdverb.kiAdvAdverbialPlace;
                attrm.Add("", attr);
            }
            wd.Add("здесь", attrm);
            wd.Save("d:/test.xml");
            Console.ReadLine();
*/        }
    }
}
