using System;
using System.Collections.Generic;
using System.Text;
using MySql.Data.MySqlClient;

namespace projetoLeilao.DATABASE
{
    internal class Conexao
    {
        // conectando no bd
        private const string strconexao = "server=localhost;uid=root;pwd=root;database=ProjetoLeilao;port=3306";

        public static MySqlConnection Conectar()
        {
            MySqlConnection conexao = new MySqlConnection(strconexao);
            {
                try
                {
                    conexao.Open();
                    Console.WriteLine("Bd conectado");
                    return conexao;
                }
                catch
                {
                    throw new Exception("Erro ao conectar no banco de dados");

                }
            }

        }
    }

}
