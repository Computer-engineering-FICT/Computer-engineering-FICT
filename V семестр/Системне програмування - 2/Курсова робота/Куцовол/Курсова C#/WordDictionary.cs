using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace C5_SP_KR
{
    class WordDictionary
    {
        Dictionary<String, AttributeModifiers> dict = new Dictionary<string, AttributeModifiers>();
        string key,tempkey;
        int size;
        public WordDictionary(String file)
        {
            XmlTextReader xml = new XmlTextReader(file);
            while (xml.Read())
            {
                if (xml.NodeType == XmlNodeType.Element)
                {
                    if (xml.Name == "Word")
                    {
                        string key = xml.GetAttribute("Name");
                        AttributeModifiers attrm = new AttributeModifiers();
                        attrm.Load(xml);
                        dict.Add(key, attrm);
                    }
                }
            }
        }
        public WordDictionary()
        {
        }
        public void Add(string word, AttributeModifiers attrm)
        {
            dict.Add(word, attrm);
        }
        public void Save(String file)
        {
            XmlTextWriter xml = new XmlTextWriter(file, System.Text.Encoding.Unicode);
            xml.WriteStartDocument();
            xml.WriteStartElement("Dictionary");
            foreach (KeyValuePair<String,AttributeModifiers> el in dict)
            {
                xml.WriteStartElement("Word");
                xml.WriteAttributeString("Name", el.Key);
                el.Value.Save(xml);
                xml.WriteEndElement();
            }
            xml.WriteEndElement();
            xml.WriteEndDocument();
            xml.Close();
        }
        public KeyValuePair<String, Attributes> findFirst(String token)
        {
            key = token;
            size = 0;
            tempkey = "";
            KeyValuePair<String, Attributes> res;
            AttributeModifiers attrm;
            if (dict.TryGetValue(tempkey, out attrm))
            {
                Attributes attr = attrm.find(key);
                if (attr != null)
                {
                    res = new KeyValuePair<string, Attributes>(attrm.BaseForm, attr);
                    return res;
                }
            }
            return findNext();
        }
        public KeyValuePair<String, Attributes> findNext()
        {
            size++;
            while (size <= key.Length)
            {
                KeyValuePair<String, Attributes> res;
                AttributeModifiers attrm;
                tempkey = key.Substring(0, size);
                if (dict.TryGetValue(tempkey, out attrm))
                {
                    Attributes attr = attrm.find(key.Substring(size));
                    if (attr != null)
                    {
                        res = new KeyValuePair<string, Attributes>(attrm.BaseForm, attr);
                        return res;
                    }
                }
                size++;
            }
            return new KeyValuePair<string,Attributes>();
        }
    }
}
