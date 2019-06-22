using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClientGUI
{
    class ConnectionException:Exception
    {
        public int value;
        public const int INVALID_CLIENT_MESSAGE_EXCEPTION = 1;
        public const int INVALID_CLIENT_ADDRESS_OR_PORT_EXCEPTION = 2;
        public const String INVALID_CLIENT_MESSAGE_MESSAGE = "Invalid client message";
        public const String INVALID_CLIENT_ADDREES_OR_PORT_MESSAGE = "Invalid client ip address or port";
        public const String undefined_exception = "Undefined exceptin";
        public ConnectionException(int value1)
        {
            value = value1;
        }
        public String getMessage()
        {
            switch (value)
            {
                case (INVALID_CLIENT_MESSAGE_EXCEPTION): { return INVALID_CLIENT_MESSAGE_MESSAGE; };
                case (INVALID_CLIENT_ADDRESS_OR_PORT_EXCEPTION): { return INVALID_CLIENT_ADDREES_OR_PORT_MESSAGE; };
            }
            return undefined_exception;
        }
    }
}
