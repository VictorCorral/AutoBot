﻿using System;
using log4net;

namespace AutoBot.Cmd
{
    class Program
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(Program));
        
        private static int Main(string[] args)
        {
            Logger.Debug("Debug statement");
            Logger.Info("Info statement");
            Logger.Error("Error statement");
            Logger.Fatal("Fatal statatement");

            Environment.ExitCode = (int)CommandLine.ExitCode.Success;
            try
            {
                HipChat.SetupChatConnection();
            }
            catch (Exception ex)
            {
                Environment.ExitCode = (int)CommandLine.ExitCode.UnknownError;
                Logger.Error("ERROR!:", ex);
            }
            return Environment.ExitCode;
        }

     }
}
