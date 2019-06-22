using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using System.Runtime.Serialization;

namespace FTPProxyServer
{
    [Serializable]
    public class Node
    {
        [XmlAttribute("File")]
        public List<String> files
        { get; set; }

        [XmlAttribute("Folders")]
        public List<String> foldersNames
        { get; set; }
        
        [XmlIgnore]
        public List<Node> folders
        { get; set; }
        
        [XmlAttribute("FolderName")]
        public String name
        { get; set; }

        public Node()
        {
            files = new List<String>();
            folders = new List<Node>();
            foldersNames = new List<String>();
        }
        public void addFile(String fileName)
        {
            files.Add(fileName);
        }

        public void addFolder(Node folderName)
        {
            folders.Add(folderName);
        }

        public List<Node> getList()
        {
            List<Node> res = new List<Node>();
            for (int i = 0; i < folders.Count; i++)
            {
                foldersNames.Add(folders.ElementAt(i).name);
                List<Node> nodes = folders.ElementAt(i).getList();   
                res.AddRange(nodes);
                res.Add(folders.ElementAt(i));
            }
            return res;
        }
    }
}
