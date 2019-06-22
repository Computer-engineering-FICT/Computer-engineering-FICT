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
using System.Windows.Shapes;
using System.Threading;

namespace ClientGUI
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class AuthorizationWnd : Window
    {
        private int singleton = 0;
        public MainWindow mainWindow;
        public AuthorizationWnd()
        {
            InitializeComponent();
        }

        private void authorizationBtn_Click(object sender, RoutedEventArgs e)
        {
            if (singleton > 0)
            {
                return;
            }
            singleton++;
            if (loginTxt.Text.Length == 0 || passwordTxt.Text.Length == 0 || ftpServerTxt.Text.Length == 0)
            {
                string messageBoxText = "You must write all parametrs of connection";
                string caption = "Connection";
                MessageBoxButton button = MessageBoxButton.OK;
                MessageBoxImage icon = MessageBoxImage.Error;
                MessageBox.Show(messageBoxText, caption, button, icon);
                return;
            }

            Logger logger = new Logger();
            mainWindow = new MainWindow(logger);
            logger.window = mainWindow;
            TCPClientToFTP client = new TCPClientToFTP(ftpServerTxt.Text, 10, ftpAddressTxt.Text,loginTxt.Text,passwordTxt.Text,logger);
            client.connect();
            {
                mainWindow.setClient(client);
                //mainWindow.setLogger(logger);
                client.mainWindow = mainWindow;
                //Thread receiveThread = new Thread(new ThreadStart(client.receiveTree));
                //receiveThread.Start();        
                mainWindow.Show();
                this.Close();
            }

        }
    }
}
