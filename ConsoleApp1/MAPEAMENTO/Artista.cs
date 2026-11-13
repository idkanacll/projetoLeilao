using System;
using System.Collections.Generic;
using System.Text;
using projetoLeilao.INTERFACE;

namespace projetoLeilao.MAPEAMENTO
{
    internal class Artista
    {
        public int IdArtista { get; set; }
        public DateOnly DataNascimento { get; set; }
        private string Nacionalidade;
        private int id_pessoa_fk { get; set; }

        public string GetNacionalidade()
        {
            return Nacionalidade;
        }
        public void SetNacionalidade(string nacionalidade)
        {
            if (nacionalidade.Length > 0)
            {
                Nacionalidade = nacionalidade;
            }
            else
            {
                throw new Exception("Nacionalidade inválida. Insira sua nacionalidade!");
            }

            Nacionalidade = nacionalidade;
        }

        public int GetIdPessoaFk()
        {
            return id_pessoa_fk;
        }

    }
}
