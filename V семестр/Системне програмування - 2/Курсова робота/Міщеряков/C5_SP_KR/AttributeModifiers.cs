using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace C5_SP_KR
{
    class AttributeModifiers
    {
        Dictionary<String, Attributes> table = new Dictionary<String, Attributes>();
        public string BaseForm;
        public Attributes find(String token)
        {
            Attributes attr;
            bool b = table.TryGetValue(token, out attr);
            if (b)
                return attr;
            return null;
        }
        public void Add(String key, Attributes value)
        {
            table.Add(key, value);
        }
        public void Save(XmlTextWriter xml)
        {
            xml.WriteStartElement("Forms");
            xml.WriteAttributeString("BaseForm", BaseForm);
            foreach (KeyValuePair<String, Attributes> el in table)
            {
                xml.WriteStartElement("Form");
                xml.WriteAttributeString("Name", el.Key);
                el.Value.Save(xml);
                xml.WriteEndElement();
            }
            xml.WriteEndElement();
        }
        public void Load(XmlTextReader xml)
        {
            xml.Read();
            if (xml.NodeType == XmlNodeType.Element)
            {
                if (xml.Name == "Forms")
                {
                    BaseForm = xml.GetAttribute("BaseForm");
                    while (xml.Read() && xml.NodeType == XmlNodeType.Element)
                    {
                        if (xml.Name == "Form")
                        {
                            string key = xml.GetAttribute("Name");
                            Attributes attr = new Attributes();
                            if (xml.NodeType == XmlNodeType.Element)
                            {
                                string type = xml.GetAttribute("Type");
                                if (type == NodeStruct.tyNou.ToString())
                                {
                                    attr = new AttributesNoun();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyAdj.ToString())
                                {
                                    attr = new AttributesAdjective();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyNum.ToString())
                                {
                                    attr = new AttributesNumeral();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyPro.ToString())
                                {
                                    attr = new AttributesPronoun();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyVer.ToString())
                                {
                                    attr = new AttributesVerb();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyAdv.ToString())
                                {
                                    attr = new AttributesAdverb();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyPre.ToString())
                                {
                                    attr = new AttributesPreposition();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyUni.ToString())
                                {
                                    attr = new AttributesUnion();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyPar.ToString())
                                {
                                    attr = new AttributesParticle();
                                    attr.Load(xml);
                                }
                                if (type == NodeStruct.tyInt.ToString())
                                {
                                    attr = new AttributesInterjection();
                                    attr.Load(xml);
                                }
                            }
                            table.Add(key, attr);
                        }
                    }
                }
            }
        }
    }
}
