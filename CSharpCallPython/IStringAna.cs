using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpCallPython
{
    /// <summary>
    /// 字符串分析
    /// </summary>
    interface IStringAna
    {
        /// <summary>
        /// key:文本包含的汉字或英文单词，value:汉字或英文单词出现的次数
        /// </summary>
        /// <param name="text"></param>
        /// <returns>key:文本包含的汉字或英文单词，value:汉字或英文单词出现的次数</returns>
        Dictionary<string, int> Ana(string text);
    }
    class StringAna : IStringAna
    {
        public Dictionary<string, int> Ana(string text)
        {
            var words = new List<string>();
            var dict = new Dictionary<string, int>();
            byte[] bts = Encoding.Unicode.GetBytes(text);
            //foreach (var bt in bts)
            //{
            //    Console.Write(string.Format("{0} ",bt));
            //}
            //Console.WriteLine();
            var pointer = 0;
            var i = 0;
            while (i <= bts.Length - 2)
            {
                byte[] tmp;

                if (bts[i + 1] == 0 && bts[i] != 32)
                {
                    pointer = i;
                    while (pointer + 2 < bts.Length && bts[pointer + 2] != 32 && bts[pointer + 2 + 1] == 0)
                    {
                        pointer += 2;
                    }
                    var len = pointer + 2 - i;
                    tmp = new byte[len];
                    Array.Copy(bts, i, tmp, 0, len);
                    i = pointer + 2;
                }
                else if (bts[i] == 32 && bts[i + 1] == 0)
                {
                    i += 2;
                    continue;
                }
                else
                {
                    tmp = new byte[] { bts[i], bts[i + 1] };
                    i += 2;
                }
                var word = Bytes2Word(tmp);
                words.Add(word);
                Put(dict, Bytes2Word(tmp));
            }
            return dict;
        }


        string Bytes2Word(byte[] bytes)
        {
            return Encoding.Unicode.GetString(bytes);
        }

        void Put(Dictionary<string, int> dict, string word)
        {
            int value;
            if (dict.TryGetValue(word, out value))
            {
                dict[word] = value + 1;
            }
            else
            {
                dict[word] = 1;
            }

        }
    }
}
