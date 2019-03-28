using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Ruanmou.Common.Security
{
    /// <summary>
    /// 注意，该AES的密文已作BASE64编码，密文不可通用， 如果有需要，先将BASE64解码
    /// </summary>
    public static class AesEncrypt
    {

        #region AES加密
        /// <summary>
        /// AES加密
        /// </summary>
        /// <param name="plainStr">明文字符串</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <returns></returns>
        public static string Encrypt(string plainStr,string key,string iv)
        {
            byte[] bKey = Encoding.UTF8.GetBytes(key);
            byte[] bIV = Encoding.UTF8.GetBytes(iv);
            return Encrypt(plainStr, bKey, bIV);
        }

        /// <summary>
        /// AES加密
        /// </summary>
        /// <param name="plainStr">明文字符串</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <param name="size">加密强度，取值128、192，256</param>
        /// <returns></returns>
        public static string Encrypt(string plainStr, string key, string iv, int size)
        {
            byte[] bKey = Encoding.UTF8.GetBytes(key);
            byte[] bIV = Encoding.UTF8.GetBytes(iv);

            return Encrypt(plainStr, bKey, bIV, size);
        }

        /// <summary>
        /// AES加密
        /// </summary>
        /// <param name="plainStr">明文字符串</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <returns>密文</returns>
        public static string Encrypt(string plainStr, byte[] key, byte[] iv)
        {
            byte[] byteArray = Encoding.UTF8.GetBytes(plainStr);

            string encrypt;
            Rijndael aes = Rijndael.Create();
            try
            {
                using (MemoryStream mStream = new MemoryStream())
                {
                    using (CryptoStream cStream = new CryptoStream(mStream, aes.CreateEncryptor(key, iv), CryptoStreamMode.Write))
                    {
                        cStream.Write(byteArray, 0, byteArray.Length);
                        cStream.FlushFinalBlock();
                        encrypt = Convert.ToBase64String(mStream.ToArray());
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            aes.Clear();

            return encrypt;
        }

        /// <summary>
        /// AES加密
        /// </summary>
        /// <param name="plainStr">明文字符串</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <param name="size">加密强度，取值128、192，256</param>
        /// <returns></returns>
        public static string Encrypt(string plainStr, byte[] key, byte[] iv, int size)
        {
            byte[] byteArray = Encoding.UTF8.GetBytes(plainStr);

            string encrypt;
            Rijndael aes = Rijndael.Create();
            aes.KeySize = size;
            aes.BlockSize = size;
            try
            {
                using (MemoryStream mStream = new MemoryStream())
                {
                    using (CryptoStream cStream = new CryptoStream(mStream, aes.CreateEncryptor(key, iv), CryptoStreamMode.Write))
                    {
                        cStream.Write(byteArray, 0, byteArray.Length);
                        cStream.FlushFinalBlock();
                        encrypt = Convert.ToBase64String(mStream.ToArray());
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            aes.Clear();

            return encrypt;
        }
        #endregion

        #region AES解密

        /// <summary>
        /// AES解密
        /// </summary>
        /// <param name="encryptStr">密文字符串</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <returns>明文</returns>
        public static string Decrypt(string encryptStr, string key, string iv)
        {
            try
            {
                byte[] bKey = Encoding.UTF8.GetBytes(key);
                byte[] bIV = Encoding.UTF8.GetBytes(iv);
                return Decrypt(encryptStr, bKey, bIV);
            }
            catch (Exception) { return "解密出错"; }
        }

        /// <summary>
        ///  AES解密
        /// </summary>
        /// <param name="encryptStr">密文字符串</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <param name="size">加密强度，取值128、192，256</param>
        /// <returns></returns>
        public static string Decrypt(string encryptStr, string key, string iv, int size)
        {
            try
            {
                //return encryptStr;
                byte[] bKey = Encoding.UTF8.GetBytes(key);
                byte[] bIV = Encoding.UTF8.GetBytes(iv);

                return Decrypt(encryptStr, bKey, bIV, size);
            }
            catch (Exception) { return "解密出错"; }
        }

        /// <summary>
        /// AES解密
        /// </summary>
        /// <param name="encryptStr">密文字符串</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <returns>明文</returns>
        public static string Decrypt(string encryptStr, byte[] key, byte[] iv)
        {
            try
            {
                byte[] byteArray = Convert.FromBase64String(encryptStr);

                string decrypt;
                Rijndael aes = Rijndael.Create();
                try
                {
                    using (MemoryStream mStream = new MemoryStream())
                    {
                        using (
                            CryptoStream cStream = new CryptoStream(mStream, aes.CreateDecryptor(key, iv),
                                CryptoStreamMode.Write))
                        {
                            cStream.Write(byteArray, 0, byteArray.Length);
                            cStream.FlushFinalBlock();
                            decrypt = Encoding.UTF8.GetString(mStream.ToArray());
                        }
                    }
                }
                catch
                {
                    throw;
                    //throw new Exception(ex.Message);
                }
                aes.Clear();
                return decrypt;
            }
            catch
            {
                throw;
                //return "解密出错";
            }
        }

        /// <summary>
        ///  AES解密
        /// </summary>
        /// <param name="encryptStr">密文字符串</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <param name="size">加密强度，取值128、192，256</param>
        /// <returns></returns>
        public static string Decrypt(string encryptStr, byte[] key, byte[] iv, int size)
        {
            try
            {
                byte[] byteArray = Convert.FromBase64String(encryptStr);

                string decrypt;
                Rijndael aes = Rijndael.Create();
                aes.KeySize = size;
                aes.BlockSize = size;
                try
                {
                    using (MemoryStream mStream = new MemoryStream())
                    {
                        using (CryptoStream cStream = new CryptoStream(mStream, aes.CreateDecryptor(key, iv), CryptoStreamMode.Write))
                        {
                            cStream.Write(byteArray, 0, byteArray.Length);
                            cStream.FlushFinalBlock();
                            decrypt = Encoding.UTF8.GetString(mStream.ToArray());
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                aes.Clear();
                return decrypt;
            }
            catch (Exception) { return "解密出错"; }
        }

        #endregion

        #region 加解密文件
        /// <summary>
        /// 加密文件
        /// </summary>
        /// <param name="inputFilePath">要加密的文件路径</param>
        /// <param name="outFilePath">加密后的文件保存路径</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        public static void EncryptFile(string inputFilePath, string outFilePath, byte[] key, byte[] iv)
        {

            try
            {
                byte[] buffer = new byte[4096];
                Rijndael crypt = Rijndael.Create();
                ICryptoTransform transform = crypt.CreateEncryptor(key, iv);
                //写进文件
                using (FileStream fswrite = new FileStream(outFilePath, FileMode.Create))
                {
                    using (CryptoStream cs = new CryptoStream(fswrite, transform, CryptoStreamMode.Write))
                    {
                        //打开文件
                        using (FileStream fsread = new FileStream(inputFilePath, FileMode.Open))
                        {
                            int length;
                            //while ((length = fsread.ReadByte()) != -1)
                            //cs.WriteByte((byte)length);
                            while ((length = fsread.Read(buffer, 0, 4096)) > 0)
                            {
                                cs.Write(buffer, 0, length);
                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 加密文件
        /// </summary>
        /// <param name="inputFilePath">要加密的文件路径</param>
        /// <param name="outFilePath">加密后的文件保存路径</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <param name="size">加密强度，取值128、192，256</param>
        public static void EncryptFile(string inputFilePath, string outFilePath, byte[] key, byte[] iv, int size)
        {


            try
            {
                byte[] buffer = new byte[4096];
                Rijndael crypt = Rijndael.Create();
                crypt.KeySize = size;
                crypt.BlockSize = size;
                ICryptoTransform transform = crypt.CreateEncryptor(key, iv);
                //写进文件
                using (FileStream fswrite = new FileStream(outFilePath, FileMode.Create))
                {
                    using (CryptoStream cs = new CryptoStream(fswrite, transform, CryptoStreamMode.Write))
                    {
                        //打开文件
                        using (FileStream fsread = new FileStream(inputFilePath, FileMode.Open))
                        {
                            int length;
                            //while ((length = fsread.ReadByte()) != -1)
                            //cs.WriteByte((byte)length);
                            while ((length = fsread.Read(buffer, 0, 4096)) > 0)
                            {
                                cs.Write(buffer, 0, length);
                            }
                        }

                    }

                }


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }


        /// <summary>
        /// 解密文件
        /// </summary>
        /// <param name="inputFilePath">要解密的文件路径</param>
        /// <param name="outFilePath">解密后的文件保存路径</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        public static void DecryptFile(string inputFilePath, string outFilePath, string key, string iv)
        {
            try
            {
                byte[] bKey = Encoding.UTF8.GetBytes(key);
                byte[] bIV = Encoding.UTF8.GetBytes(iv);
                DecryptFile(inputFilePath, outFilePath, bKey, bIV);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 解密文件
        /// </summary>
        /// <param name="inputFilePath">要解密的文件路径</param>
        /// <param name="outFilePath">解密后的文件保存路径</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <param name="size"></param>
        public static void DecryptFile(string inputFilePath, string outFilePath, string key, string iv, int size)
        {
            try
            {
                byte[] bKey = Encoding.UTF8.GetBytes(key);
                byte[] bIV = Encoding.UTF8.GetBytes(iv);
                DecryptFile(inputFilePath, outFilePath, bKey, bIV, size);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 解密文件
        /// </summary>
        /// <param name="inputFilePath">要解密的文件路径</param>
        /// <param name="outFilePath">解密后的文件保存路径</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        public static void DecryptFile(string inputFilePath, string outFilePath, byte[] key, byte[] iv)
        {
            try
            {
                byte[] buffer = new byte[4096];
                Rijndael crypt = Rijndael.Create();
                ICryptoTransform transform = crypt.CreateDecryptor(key, iv);
                //读取加密后的文件 
                using (FileStream fsopen = new FileStream(inputFilePath, FileMode.Open))
                {
                    using (CryptoStream cs = new CryptoStream(fsopen, transform, CryptoStreamMode.Read))
                    {
                        //把解密后的结果写进文件
                        using (FileStream fswrite = new FileStream(outFilePath, FileMode.OpenOrCreate))
                        {
                            int length;
                            //while ((length = cs.ReadByte()) != -1)
                            //fswrite.WriteByte((byte)length);
                            while ((length = cs.Read(buffer, 0, 4096)) > 0)
                            {
                                fswrite.Write(buffer, 0, length);
                            }
                        }

                    }

                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        /// <summary>
        /// 解密文件
        /// </summary>
        /// <param name="inputFilePath">要解密的文件路径</param>
        /// <param name="outFilePath">解密后的文件保存路径</param>
        /// <param name="key">32位</param>
        /// <param name="iv">16位</param>
        /// <param name="size"></param>
        public static void DecryptFile(string inputFilePath, string outFilePath, byte[] key, byte[] iv, int size)
        {
            try
            {
                byte[] buffer = new byte[4096];
                Rijndael crypt = Rijndael.Create();
                crypt.KeySize = size;
                crypt.BlockSize = size;
                ICryptoTransform transform = crypt.CreateDecryptor(key, iv);
                //读取加密后的文件 
                using (FileStream fsopen = new FileStream(inputFilePath, FileMode.Open))
                {
                    using (CryptoStream cs = new CryptoStream(fsopen, transform, CryptoStreamMode.Read))
                    {
                        //把解密后的结果写进文件
                        using (FileStream fswrite = new FileStream(outFilePath, FileMode.OpenOrCreate))
                        {
                            int length;
                            while ((length = cs.Read(buffer, 0, 4096)) > 0)
                            {
                                fswrite.Write(buffer, 0, length);
                            }
                        }

                    }

                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        #endregion
    }
}
