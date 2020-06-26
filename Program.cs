using System;
using System.Diagnostics;
using System.IO;

namespace GPTest
{
    class Program
    {
        static void Main(string[] args)
        {
            var parser = new Parser(Console.OpenStandardInput());
            parser.Parse();
        }
    }
}
