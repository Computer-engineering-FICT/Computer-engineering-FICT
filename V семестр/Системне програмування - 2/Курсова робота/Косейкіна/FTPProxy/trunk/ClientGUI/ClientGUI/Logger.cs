using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClientGUI
{
    public class Logger
    {
        public bool isUpdate = true;
        public MainWindow window;
        public List<String> messages;
        public Logger()
        {
            messages = new List<String>();
        }

        public void addMessage(String message)
        {
            DateTime dt = DateTime.Now;
            String messageTime = dt.ToString();
            String fullMes = messageTime + ": " + message;
            messages.Add(fullMes);
            isUpdate = true;
        }
    }
}
