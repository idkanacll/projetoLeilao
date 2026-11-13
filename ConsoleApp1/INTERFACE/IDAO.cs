using System;
using System.Collections.Generic;
using System.Text;

namespace projetoLeilao.INTERFACE
{
    internal interface IDAO <T>
    {
        //para que todos od DAOs tenhas os mesmo nomes de metodos
        void Inserir(T obj);
        void Alterar(T obj);
        void Excluir(int id);
        List<T> Listar();
        T BuscarPorId(int id);
    }
}
