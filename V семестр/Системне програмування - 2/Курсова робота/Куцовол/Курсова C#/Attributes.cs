using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace C5_SP_KR
{
    enum eGender { geNull=0 ,geMale, geFemale, geDual, geCommon, geInaimate };
    enum eCase { caNull=0, caNominative, caGenitive, caDativr, caAccusative, caAblative, caPreposition };
    enum eNumber { nuNull=0, nuSingular, nuPlural };
    enum eComparation { coNull=0, coPositive, coComparative, coSuperlative };
    enum ePerson { peNull=0, peFirst, peSecond, peThird };
    enum eInclination { inNull=0, inRealist, inImperative, inConditional };
    enum eTime { tiNull=0, tiPresent, tiPast, tiFuture };
    enum eForm { foNull=0, foImperfective, foPerfective };
    enum eKindAdjective { kiNull=0, kiAdjQualitive, kaAdjRelative, kaAdjPossessive };
    enum eKindNumeral { kiNull=0, kiNumCardinal, kiNumOrdinal, kiNumPartitive, kiNumMultiplicative, kiNumCollective, kiNumDistributive };
    enum eKindPronoun { kiNull=0, kiProPersonal, kiProReflexive, kiProPossessivve, kiProInterrogative, kiProIndication, kiProDistributive, kiProNegative, kiProMutual };
    enum eKindAdverb { kiNull=0, kiAdvAdverbialPlace, kiAdvAdverbialTime, kiAdvAdverbialReason, kiAdvAdverbialGoal, kiAdvIdentificationQualitative, kiAdvIdentificationQuantitative, kiAdvIdentificationMethod, kiAdvIdentificationComparison, kiAdvIdentificationAggregate };
    enum eKindPreposition { kiNull=0, kiPreSpatial, kiPreTemporal, kiPreComparison, kiPreContent, kiPreAgent, kiPreInstrument, kiPreCause, kiPreReference };
    enum eKindUnion { kiNull=0, kiUniConnecting, kiUniDividing, kiUniComparative, kiUniComparative1, kiUniExplenatory, kiUniExplanatory, kiUniTemporary, kiUniContingent, kiUniCasual, kiUniConcessive, kiUniRestrictive, kiUniGradation };
    class Attributes
    {
        public const int type = NodeStruct.tyNull;
        public string BaseForm;
        public virtual void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("Type", type.ToString());
        }
        public virtual void Load(XmlTextReader xml)
        {
            string str = xml.GetAttribute("BaseForm");
            BaseForm = str;
        }
        public virtual int getWordType()
        {
            return type;
        }
        public virtual string toString()
        {
            return type+"";
        }
    }
    class AttributesNoun : Attributes
    {
        public const int type = NodeStruct.tyNou;
        public eGender Gender;//рід
        public eCase Case;//відмінок
        public eNumber Number;//число
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
            xml.WriteAttributeString("Gender", Gender.ToString());
            xml.WriteAttributeString("Case", Case.ToString());
            xml.WriteAttributeString("Number", Number.ToString());
        }
        public override void Load(XmlTextReader xml)
        {
            base.Load(xml);
            string str;
            str = xml.GetAttribute("Gender");
            Gender = (eGender)eGender.Parse(typeof(eGender), str);
            str = xml.GetAttribute("Case");
            Case = (eCase)eCase.Parse(typeof(eCase), str);
            str = xml.GetAttribute("Number");
            Number = (eNumber)eNumber.Parse(typeof(eNumber), str);
        }
        public override int getWordType()
        {
            return type;
        }
        public override string toString()
        {
            return "Type="+type+"\nGender="+Gender + "\nCase=" + Case + "\nNumber=" + Number;
        }
    }
    class AttributesAdjective : Attributes
    {
        public const int type = NodeStruct.tyAdj;
        public eGender Gender;//рід
        public eCase Case;//відмінок
        public eNumber Number;//число
        public eKindAdjective Kind;//вид
        public eComparation Comparison;//степінь порівняння
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
            xml.WriteAttributeString("Gender", Gender.ToString());
            xml.WriteAttributeString("Case", Case.ToString());
            xml.WriteAttributeString("Number", Number.ToString());
            xml.WriteAttributeString("Kind", Kind.ToString());
            xml.WriteAttributeString("Comparison", Comparison.ToString());
        }
        public override void Load(XmlTextReader xml)
        {
            base.Load(xml);
            string str;
            str = xml.GetAttribute("Gender");
            Gender = (eGender)eGender.Parse(typeof(eGender), str);
            str = xml.GetAttribute("Case");
            Case = (eCase)eCase.Parse(typeof(eCase), str);
            str = xml.GetAttribute("Number");
            Number = (eNumber)eNumber.Parse(typeof(eNumber), str);
            str = xml.GetAttribute("Kind");
            Kind = (eKindAdjective)eKindAdjective.Parse(typeof(eKindAdjective), str);
            str = xml.GetAttribute("Comparison");
            Comparison = (eComparation)eComparation.Parse(typeof(eComparation), str);
        }
        public override string toString()
        {
            return "Type=" + type + "\nGender=" + Gender + "\nCase=" + Case + "\nNumber=" + Number + "\nKind=" + Kind + "\nComparison=" + Comparison;
        }
        public override int getWordType()
        {
            return type;
        }
    }
    class AttributesNumeral : Attributes
    {
        public const int type = NodeStruct.tyNum;
        public eGender Gender;//рід
        public eCase Case;//відмінок
        public eKindNumeral Kind;//вид
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
            xml.WriteAttributeString("Gender", Gender.ToString());
            xml.WriteAttributeString("Case", Case.ToString());
            xml.WriteAttributeString("Kind", Kind.ToString());
        }
        public override void Load(XmlTextReader xml)
        {
            base.Load(xml);
            string str;
            str = xml.GetAttribute("Gender");
            Gender = (eGender)eGender.Parse(typeof(eGender), str);
            str = xml.GetAttribute("Case");
            Case = (eCase)eCase.Parse(typeof(eCase), str);
            str = xml.GetAttribute("Kind");
            Kind = (eKindNumeral)eKindNumeral.Parse(typeof(eKindNumeral), str);
        }
        public override string toString()
        {
            return "Type=" + type + "\nGender=" + Gender + "\nCase=" + Case + "\nKind=" + Kind;
        }
        public override int getWordType()
        {
            return type;
        }
    }
    class AttributesPronoun : Attributes
    {
        public const int type = NodeStruct.tyPro;
        public ePerson Person;//особа
        public eCase Case;//відмінок
        public eNumber Number;//число
        public eKindPronoun Kind;//вид
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
            xml.WriteAttributeString("Person", Person.ToString());
            xml.WriteAttributeString("Case", Case.ToString());
            xml.WriteAttributeString("Number", Number.ToString());
            xml.WriteAttributeString("Kind", Kind.ToString());
        }
        public override void Load(XmlTextReader xml)
        {
            base.Load(xml);
            string str;
            str = xml.GetAttribute("Person");
            Person = (ePerson)ePerson.Parse(typeof(ePerson), str);
            str = xml.GetAttribute("Case");
            Case = (eCase)eCase.Parse(typeof(eCase), str);
            str = xml.GetAttribute("Number");
            Number = (eNumber)eNumber.Parse(typeof(eNumber), str);
            str = xml.GetAttribute("Kind");
            Kind = (eKindPronoun)eKindPronoun.Parse(typeof(eKindPronoun), str);
        }
        public override string toString()
        {
            return "Type=" + type + "\nPerson=" + Person + "\nCase=" + Case + "\nNumber=" + Number + "\nKind=" + Kind;
        }
        public override int getWordType()
        {
            return type;
        }
    }
    class AttributesVerb : Attributes
    {
        public const int type = NodeStruct.tyVer;
        public eInclination Inclination;
        public eTime Time;//час
        public eGender Gender;//рід
        public ePerson Person;//особа
        public eNumber Number;//число
        public eForm Form;//форма
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
            xml.WriteAttributeString("Inclination", Inclination.ToString());
            xml.WriteAttributeString("Time", Time.ToString());
            xml.WriteAttributeString("Gender", Gender.ToString());
            xml.WriteAttributeString("Person", Person.ToString());
            xml.WriteAttributeString("Number", Number.ToString());
            xml.WriteAttributeString("Form", Form.ToString());
        }
        public override void Load(XmlTextReader xml)
        {
            base.Load(xml);
            string str;
            str = xml.GetAttribute("Inclination");
            Inclination = (eInclination)eInclination.Parse(typeof(eInclination), str);
            str = xml.GetAttribute("Time");
            Time = (eTime)eTime.Parse(typeof(eTime), str);
            str = xml.GetAttribute("Gender");
            Gender = (eGender)eGender.Parse(typeof(eGender), str);
            str = xml.GetAttribute("Person");
            Person = (ePerson)ePerson.Parse(typeof(ePerson), str);
            str = xml.GetAttribute("Number");
            Number = (eNumber)eNumber.Parse(typeof(eNumber), str);
            str = xml.GetAttribute("Form");
            Form = (eForm)eForm.Parse(typeof(eForm), str);
        }
        public override string toString()
        {
            return "Type=" + type + "\nGender=" + Gender + "\nPerson=" + Person + "\nNumber=" + Number + "\nForm=" + Form;
        }
        public override int getWordType()
        {
            return type;
        }
    }
    class AttributesAdverb : Attributes
    {
        public const int type = NodeStruct.tyAdv;
        public eKindAdverb Kind;//вид
        public eComparation Comparison;//степінь порівняння
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
            xml.WriteAttributeString("Kind", Kind.ToString());
            xml.WriteAttributeString("Comparison", Comparison.ToString());
        }
        public override void Load(XmlTextReader xml)
        {
            base.Load(xml);
            string str;
            str = xml.GetAttribute("Kind");
            Kind = (eKindAdverb)eKindAdverb.Parse(typeof(eKindAdverb), str);
            str = xml.GetAttribute("Comparison");
            Comparison = (eComparation)eComparation.Parse(typeof(eComparation), str);
        }
        public override string toString()
        {
            return "Type=" + type + "\nKind=" + Kind + "\nComparison=" + Comparison;
        }
        public override int getWordType()
        {
            return type;
        }
    }
    class AttributesPreposition : Attributes
    {
        public const int type = NodeStruct.tyPre;
        public eKindPreposition Kind;//вид
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
            xml.WriteAttributeString("Kind", Kind.ToString());
        }
        public override void Load(XmlTextReader xml)
        {
            base.Load(xml);
            string str;
            str = xml.GetAttribute("Kind");
            Kind = (eKindPreposition)eKindPreposition.Parse(typeof(eKindPreposition), str);
        }
        public override string toString()
        {
            return "Type=" + type + "\nKind=" + Kind;
        }
        public override int getWordType()
        {
            return type;
        }
    }
    class AttributesUnion : Attributes
    {
        public const int type = NodeStruct.tyUni;
        public eKindUnion Kind;//вид
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
            xml.WriteAttributeString("Kind", Kind.ToString());
        }
        public override void Load(XmlTextReader xml)
        {
            base.Load(xml);
            string str;
            str = xml.GetAttribute("Kind");
            Kind = (eKindUnion)eKindUnion.Parse(typeof(eKindUnion), str);
        }
        public override string toString()
        {
            return "Type=" + type + "\nKind=" + Kind;
        }
        public override int getWordType()
        {
            return type;
        }
    }
    class AttributesParticle : Attributes
    {
        public const int type = NodeStruct.tyPar;
        public override string toString()
        {
            return "Type=" + type;
        }
        public override int getWordType()
        {
            return type;
        }
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
        }
    }
    class AttributesInterjection : Attributes
    {
        public const int type = NodeStruct.tyInt;
        public override string toString()
        {
            return "Type=" + type;
        }
        public override int getWordType()
        {
            return type;
        }
        public override void Save(XmlWriter xml)
        {
            xml.WriteAttributeString("BaseForm", BaseForm);
            xml.WriteAttributeString("Type", type.ToString());
        }
    }
}
