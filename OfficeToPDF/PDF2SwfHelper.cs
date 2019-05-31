using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OfficeToPDF
{
    public class PDF2SwfHelper
    {
        #region 1.0 转换所有的页，图片质量100% +  bool PDF2SWF(string pdfPath, string swfPath)
        /// <summary>
        /// 转换所有的页，图片质量100%
        /// </summary>
        /// <param name="pdfPath">PDF文件地址</param>
        /// <param name="swfPath">生成后的SWF文件地址</param>
        public static bool PDF2SWF(string pdfPath, string swfPath)
        {
            return PDF2SWF(pdfPath, swfPath, 1, GetPageCount(pdfPath), 100);
        }
        #endregion

        #region 2.0 转换前N页，图片质量100% + bool PDF2SWF(string pdfPath, string swfPath, int page)
        /// <summary>
        /// 转换前N页，图片质量100%
        /// </summary>
        /// <param name="pdfPath">PDF文件地址</param>
        /// <param name="swfPath">生成后的SWF文件地址</param>
        /// <param name="page">页数</param>
        public static bool PDF2SWF(string pdfPath, string swfPath, int page)
        {
            return PDF2SWF(pdfPath, swfPath, 1, page, 100);
        }
        #endregion

        #region 3.0 PDF格式转为SWF + bool PDF2SWF(string pdfPath, string swfPath, int beginpage, int endpage, int photoQuality)
        /// <summary>
        /// PDF格式转为SWF
        /// </summary>
        /// <param name="pdfPath">PDF文件地址</param>
        /// <param name="swfPath">生成后的SWF文件地址</param>
        /// <param name="beginpage">转换开始页</param>
        /// <param name="endpage">转换结束页</param>
        private static bool PDF2SWF(string pdfPath, string swfPath, int beginpage, int endpage, int photoQuality)
        {

            //swftool，首先先安装，然后将安装目录下的东西拷贝到相应目录下
            string exe = System.IO.Path.GetFullPath("pdf2swf.exe");
            //string exe = System.Web.Hosting.HostingEnvironment.MapPath("~");
            //pdfPath = HttpContext.Current.Server.MapPath(pdfPath);
            //swfPath = HttpContext.Current.Server.MapPath(swfPath);
            if (!System.IO.File.Exists(exe) || !System.IO.File.Exists(pdfPath))
            {
                return false;
            }
            StringBuilder sb = new StringBuilder();
            sb.Append(" \"" + pdfPath + "\"");
            sb.Append(" -o \"" + swfPath + "\"");
            sb.Append(" -s flashversion=9");
            if (endpage > GetPageCount(pdfPath)) endpage = GetPageCount(pdfPath);
            sb.Append(" -p " + "\"" + beginpage + "" + "-" + endpage + "\"");
            sb.Append(" -j " + photoQuality);
            string Command = sb.ToString();
            System.Diagnostics.Process p = new System.Diagnostics.Process();
            p.StartInfo.FileName = exe;
            p.StartInfo.Arguments = Command;
            p.StartInfo.WorkingDirectory = System.IO.Path.GetFullPath("../Release/");
            string ss = p.StartInfo.WorkingDirectory;
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.CreateNoWindow = false;
            p.Start();
            p.BeginErrorReadLine();
            p.WaitForExit();
            p.Close();
            p.Dispose();
            return true;
        }

        #endregion

        #region 4.0 返回页数 + int GetPageCount(string pdfPath)
        /// <summary>
        /// 返回页数
        /// </summary>
        /// <param name="pdfPath">PDF文件地址</param>
        private static int GetPageCount(string pdfPath)
        {
            byte[] buffer = System.IO.File.ReadAllBytes(pdfPath);
            int length = buffer.Length;
            if (buffer == null)
                return -1;
            if (buffer.Length <= 0)
                return -1;
            string pdfText = Encoding.Default.GetString(buffer);
            System.Text.RegularExpressions.Regex rx1 = new System.Text.RegularExpressions.Regex(@"/Type\s*/Page[^s]");
            System.Text.RegularExpressions.MatchCollection matches = rx1.Matches(pdfText);
            return matches.Count;
        }
        #endregion
    }
}
