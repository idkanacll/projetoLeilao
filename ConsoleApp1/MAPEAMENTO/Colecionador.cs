using System;
using System.Collections.Generic;
using System.Text;

namespace projetoLeilao.MAPEAMENTO
{
    internal class Colecionador
    {
        public int IdColecionador { get; set; }
        private int _IdPessoaFk {
            get { return _IdPessoaFk; }
            set
            {
                if (value == 0)
                {
                    throw new Exception("Id Pessoa invalido");
                }
                else
                {
                    _IdPessoaFk = value;
                }
            }
        }
        private double _LimiteCredito
        {
            get { return _LimiteCredito; }
            set
            {
                if (value <= 0)
                {
                    throw new Exception("Credito indisponivel");
                }
                else
                {
                    _LimiteCredito = value;
                }

            }
        }

    }
}