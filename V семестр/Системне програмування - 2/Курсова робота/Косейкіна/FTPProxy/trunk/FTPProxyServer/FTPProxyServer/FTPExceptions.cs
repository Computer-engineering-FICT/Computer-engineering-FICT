using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FTPProxyServer
{
    class FTPExceptions: Exception
    {
        public int value;
        public const  int INVALID_FILE_LIST_EXCEPTION=1;
        public const int INVALID_BUILDING_AND_SERIALIZING_TREE_EXCEPTION = 2;
        public const int INVALID_DOWNLOADING_FILE_EXCEPTION = 3;
        public const int INVALID_UPLOADING_FILE_EXCEPTION = 4;
        public const int INVALID_REMOVING_FILE_EXCEPTION = 5;
        public const int INVALID_MOVING_FILE_EXCEPTION = 6;
        public const int INVALID_CREATING_FOLER_EXCEPTION = 7;
        public const int INVALID_REMOVING_FOLER_EXCEPTION = 8;
        public const int INVALID_RENAMING_FILE_EXCEPTION = 9;
        public const int INVALID_FTP_CONNECTION_EXCEPTION = 10;

        public static String invalid_file_list_message = "Invalid file list from ftp server";
        public static String invalid_building_and_serializing_tree_message = "Invalid building and serizalizing tree";
        public static String invalid_downloading_file_message = "Invalid downloading file";
        public static String invalid_uploading_file_message = "Invalid uploading file";
        public static String invalid_removing_file_message = "Invalid removing file";
        public static String invalid_moving_file_message = "Invalid moving file";
        public static String invalid_removing_folder_message = "Invalid removing folder";
        public static String invalid_creating_folder_message = "Invalid creating folder";
        public static String invalid_renaming_file_message = "Invalid renaming file";
        public static String undefined_exception = "Undefined exceptin";
        public static String invalid_FTP_connection_message = "Invalid connection to ftp server";

        public FTPExceptions(int value1)
        {
            value = value1;
        }

        public String getMessage()
        {
            switch (value)
            {
                case INVALID_FILE_LIST_EXCEPTION: { return invalid_file_list_message; };
                case INVALID_BUILDING_AND_SERIALIZING_TREE_EXCEPTION: { return invalid_building_and_serializing_tree_message; };
                case INVALID_DOWNLOADING_FILE_EXCEPTION: { return invalid_downloading_file_message; };
                case INVALID_UPLOADING_FILE_EXCEPTION: { return invalid_uploading_file_message; };
                case INVALID_MOVING_FILE_EXCEPTION: { return invalid_moving_file_message; };
                case INVALID_REMOVING_FILE_EXCEPTION: { return invalid_removing_file_message; };
                case INVALID_REMOVING_FOLER_EXCEPTION: { return invalid_removing_folder_message; };
                case INVALID_CREATING_FOLER_EXCEPTION: { return invalid_creating_folder_message; };
                case INVALID_RENAMING_FILE_EXCEPTION: { return invalid_renaming_file_message; };
                case INVALID_FTP_CONNECTION_EXCEPTION: { return invalid_FTP_connection_message; };
            }

            return undefined_exception;
        }
    }
}
