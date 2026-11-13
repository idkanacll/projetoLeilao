using System;
using System.Collections.Generic;
using System.Text;
using projetoLeilao.INTERFACE;
using MySql.Data.MySqlClient;
using projetoLeilao.MAPEAMENTO;

namespace projetoLeilao.DAO
{
    internal class PessoaDAO : IDAO<Pessoa>
    {
        public void Alterar(Pessoa obj)
        {
            throw new NotImplementedException();
        }

        public Pessoa BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public void Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public void Inserir(Pessoa obj)
        {
            throw new NotImplementedException();
        }

        public List<Pessoa> Listar()
        {
            throw new NotImplementedException();
        }
    }
}
