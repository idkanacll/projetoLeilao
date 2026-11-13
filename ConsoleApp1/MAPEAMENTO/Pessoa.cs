 using System;
using System.Collections.Generic;
using System.Text;

namespace projetoLeilao.MAPEAMENTO
{
    internal class Pessoa
    {
        public int IdPessoa { get; set; }
        public string Nome { get; set; }
        private string email { get; set; }

        public string Email
        {
            get { return email; }
            set
            {
                if (value.Contains("@")) // pra validar se é mesmo um email tem a ter o @
                {
                    email = value;
                }
                else
                {
                    throw new Exception("Email inválido");
                }
            }
        }
    }
}
