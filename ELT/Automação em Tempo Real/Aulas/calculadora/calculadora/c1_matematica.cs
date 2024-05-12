using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace calculadora
{
    class c1_matematica
    {
        public int Operacoes(int parcela1, int parcela2, string operacao)
        {
            int resultado = -1;
            switch (operacao)
            {
                case "adicao":
                    resultado = parcela1 + parcela2;
                    break;
                case "subtracao":
                    resultado = parcela1 - parcela2;
                    break;
                case "mutiplicacao":
                    resultado = parcela1 * parcela2;
                    break;
                case "divisao":
                    resultado = parcela1 * parcela2;
                    break;
                default:
                    resultado = -1000;
                    break
            }
            return resultado;
        }
        //public int Adicao(int parcela1, int parcela2)
        //{
        //    return parcela1 + parcela2;
        //}
        //public int Subtracao(int parcela1, int parcela2)
        //{
        //    return parcela1 - parcela2;
        //}
        //public int Multiplicao(int parcela1, int parcela2)
        //{
        //    return parcela1 * parcela2;
        //}
        //public int Divisao(int parcela1, int parcela2)
        //{
        //    return parcela1 / parcela2;
        //}
    }
}
