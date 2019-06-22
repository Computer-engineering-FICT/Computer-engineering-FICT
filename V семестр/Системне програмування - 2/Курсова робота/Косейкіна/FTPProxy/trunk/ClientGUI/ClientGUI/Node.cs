using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;

namespace ClientGUI
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
                List<Node> nodes = folders.ElementAt(i).getList();
                for (int j = 0; j < nodes.Count; j++)
                {
                    foldersNames.Add(nodes.ElementAt(j).name);

                    res.Add(nodes.ElementAt(j));
                }
                //System.Console.WriteLine("have add node=" + folders.ElementAt(i).name);
                foldersNames.Add(folders.ElementAt(i).name);
                res.Add(folders.ElementAt(i));
            }
            return res;
        }

        public void buildChild(List<Node> list)
        {
            this.folders = new List<Node>();
            //System.Console.WriteLine("folder for=" + name);
            for (int i = 0; i < this.foldersNames.Count; i++)
            {
                //System.Console.WriteLine("folder parent=" + this.name + " child=" + foldersNames.ElementAt(i));
                Node n = searchNodeByName(foldersNames.ElementAt(i), list);

                n.buildChild(list);

                folders.Add(n);
            }
        }

        public Node searchNodeByName(String name, List<Node> list)
        {
            for (int i = 0; i < list.Count; i++)
            {
                if (list.ElementAt(i).name.Equals(name))
                {
                    return list.ElementAt(i);
                }
            }
            return null;
        }

        public void writeTree()
        {
            System.Console.WriteLine("Current folder=" + name);
            for (int i = 0; i < files.Count; i++)
            {
                System.Console.WriteLine("file=" + files.ElementAt(i));
            }
            for (int i = 0; i < folders.Count; i++)
            {
                System.Console.WriteLine("folder=" + folders.ElementAt(i).name);

                folders.ElementAt(i).writeTree();

            }
        }


        public int isFolder(String folderName)
        {
            for (int i = 0; i < folders.Count; i++)
            {
                if (folders.ElementAt(i).name.Equals(folderName))
                {
                    return i; 
                }
            }

            return -1;
        }

        public int isFile(String fileName)
        {
            for (int i = 0; i < files.Count; i++)
            {
                if (files.ElementAt(i).Equals(fileName))
                {
                    return i;
                }
            }

            return -1;
        }
    }
}
