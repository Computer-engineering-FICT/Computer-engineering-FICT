using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Threading;
using System.IO;
using System.Windows.Threading;

namespace ClientGUI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private bool isSetNewTree;
        private List<Node> previousFolder;
        private List<String> folders;
        public Logger logger;
        public Node currentNodeFolder;
        public Node treeHead;
        public TCPClientToFTP client;
        public Timer timer;
        static private readonly object theLock = new Object();
        public MainWindow(Logger logger1)
        {
            InitializeComponent();
            previousFolder = new List<Node>();
            isSetNewTree = false;
            logger = logger1;
            DispatcherTimer dispatcherTimer = new DispatcherTimer();
            dispatcherTimer.Tick += new EventHandler(loadTree);
            dispatcherTimer.Interval = new TimeSpan(10000000);
            dispatcherTimer.Start();
        }

        private String takeName(String name)
        {
            int l=name.LastIndexOf('\\');
            if(l<0){
                l=0;
            }else{
                l++;
            }
            String res=name.Substring(l,name.Length-l);
            return res;
        }
        public void setClient(TCPClientToFTP client1)
        {
            client = client1;
        }
        public void setLogger(Logger logger1)
        {
            logger = logger1;
        }
        public void setTree(Node treeHead1)
        {
            lock (this)
            {
                logger.addMessage("Load tree");
                treeHead = treeHead1;
                isSetNewTree = true;
            }
 
        }

        private void loadTree(object sender, EventArgs e)
        {
            lock (logger)
            {
                if (logger.isUpdate)
                {
                    logList.Items.Clear();
                    for (int i = 0; i < logger.messages.Count; i++)
                    {
                        logList.Items.Add(logger.messages.ElementAt(i));
                    }
                    logger.isUpdate = false;
                }
            }
            if (!isSetNewTree)
            {
                return;
            }

            lock (this)
            {
                if (treeHead != null)
                {        
                    currentNodeFolder = treeHead; 
                    drawCurrentDirectory();
                 }
                 else
                 {
                     Console.WriteLine("TreeHad=null");
                 }
             }            
        }

        private void drawCurrentDirectory()
        {
            folders = new List<String>();
            folders.Add("...");
            for (int i = 0; i < currentNodeFolder.folders.Count; i++)
            {
                folders.Add(takeName(currentNodeFolder.folders.ElementAt(i).name));
            }
            for (int i = 0; i < currentNodeFolder.files.Count; i++)
            {
                folders.Add(takeName(currentNodeFolder.files.ElementAt(i)));
            }

            this.foldersList.Items.Clear();
            for (int i = 0; i < folders.Count; i++)
            {
                this.foldersList.Items.Add(folders.ElementAt(i));
            }
            isSetNewTree = false;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            
        }

        private void foldersList_SelectionChanged(object sender, MouseButtonEventArgs e)
        {
            if (treeHead == null || currentNodeFolder==null)
            {
                return;
            }
            
            int si = foldersList.SelectedIndex;

            String sname ="\\"+ (String)foldersList.SelectedItem;
            System.Console.WriteLine("-----------Selected item=" + si + " sname=" + sname);
            Node prevF = currentNodeFolder;
            if (si == 0)
            {
                if (previousFolder.Count == 0)
                {
                    return;
                }
                currentNodeFolder = previousFolder.ElementAt(previousFolder.Count-1);
                previousFolder.Remove(currentNodeFolder);
                currentFolder.Text = currentNodeFolder.name;
                drawCurrentDirectory();
                return;
            }
            for (int i = 0; i < currentNodeFolder.folders.Count; i++)
            {
                if (currentNodeFolder.folders.ElementAt(i).name.Equals(currentFolder.Text+sname))
                {
                    currentNodeFolder = currentNodeFolder.folders.ElementAt(i);
                    currentFolder.Text = currentNodeFolder.name;
                    previousFolder.Add(prevF);
                    drawCurrentDirectory();
                }
            }
        }

        private void deleteBtn_Click(object sender, RoutedEventArgs e)
        {
            int si = foldersList.SelectedIndex;
            if (si <= 0)
            {
                showMessageDialog("Select file", "Deleting file");
                return;
            }
            String fname = currentFolder.Text + "\\" + (String)foldersList.SelectedItem;
            
            
            int n = currentNodeFolder.isFolder(fname);
            if (n >= 0)
            {
                client.deleteFolder(fname);
                logger.addMessage("Delete folder " + fname);
                return;
            }
            String sname=null;
            if (currentFolder.Text.Length != 0)
            {
                sname = currentFolder.Text + "\\" + (String)foldersList.SelectedItem;
            }
            else
            {
                sname = (String)foldersList.SelectedItem;
            }
            n = currentNodeFolder.isFile(sname);
            if (n >= 0)
            {
                client.deleteFile(sname);
                logger.addMessage("Delete file " + sname);
                return;
            }
            logger.addMessage("Cann`t find entity "+(String)foldersList.SelectedItem);
        }


        private void showMessageDialog(String message,String caption)
        {
            if (message == null || caption == null)
            {
                return;
            }

            MessageBoxButton button = MessageBoxButton.OK;
            MessageBoxImage icon = MessageBoxImage.Error;
            MessageBox.Show(message, caption, button, icon);
        }

        private void createFolderBtn_Click(object sender, RoutedEventArgs e)
        {
            if (currentFolder==null && additionFile.Text.Length==0)
            {
                showMessageDialog("Write folder name", "Creating folder");
                return;
            }
            client.createFolder(currentFolder.Text + "\\" + additionFile.Text);
            logger.addMessage("Create folder " + currentFolder.Text + "\\" + additionFile.Text);
        }

        private void RenameBtn_Click(object sender, RoutedEventArgs e)
        {
            int si = foldersList.SelectedIndex;
            if (si <= 0 || additionFile.Text.Length==0)
            {
                showMessageDialog("Write new name of file", "Renaming file");
                return;
            }
            client.renameFile((String)foldersList.SelectedItem, currentFolder.Text + "\\" + additionFile.Text);
            logger.addMessage("Rename " + (String)foldersList.SelectedItem + " to " + currentFolder.Text + "\\" + additionFile.Text);
        }

        private void DownloadBtn_Click(object sender, RoutedEventArgs e)
        {
            int si = foldersList.SelectedIndex;
            if (si <= 0 || additionFile.Text.Length == 0)
            {
                showMessageDialog("Write destination file", "Downloading file");
                return;
            }
            client.downloadFile((String)foldersList.SelectedItem, additionFile.Text);
            logger.addMessage("Download file " + (String)foldersList.SelectedItem + " to file " + additionFile.Text);
        }

        private void UploadBtn_Click(object sender, RoutedEventArgs e)
        {
            int si = foldersList.SelectedIndex;
            if (destinationFile.Text.Length==0 || additionFile.Text.Length == 0)
            {
                showMessageDialog("Write destination file", "Uploading file");
                return;
            }
            client.uploadFile((String)additionFile.Text, destinationFile.Text);
            logger.addMessage("Upload file " + (String)additionFile.Text + " to file " + destinationFile.Text);

        }

    }
}
