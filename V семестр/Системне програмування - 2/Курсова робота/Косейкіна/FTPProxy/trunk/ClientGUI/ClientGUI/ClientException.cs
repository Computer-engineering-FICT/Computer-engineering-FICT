using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClientGUI
{
    class ClientException:Exception
    {
        public int value;
        public const int INVALID_SERVER_ADDRESS_OR_PORT_EXCEPTION=1;

        public const String invalid_server_address_or_port_message = "Invalid server address or port";
        public const String invalid_received_message = "Invalid receiver message";
        public const String undefined_exception = "Undefined exception";
        public ClientException(int value1)
        {
            value = value1;
        }
        public String getMessage()
        {
            switch (value)
            {
                case (INVALID_SERVER_ADDRESS_OR_PORT_EXCEPTION): { return invalid_server_address_or_port_message; };
            }
            return undefined_exception;
        }
    }
}
