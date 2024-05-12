using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace T3_96708_ELT479
{
    public class Class1
    {
        public int x = 957;      //Posição na horizontal
        public int y = 55;      //Posição na vertical
        public int identidade = 0;
        public int variavel;
        public int cor;        

        //=============================================================================
        Boolean pista = true;
        public Boolean chegada = false;
        public Boolean decole = false;
        public DateTime estacionar;
        public DateTime estacionar1;

        public string datachegada;

        //=============================================================================

        //definindo velocidade
        public int velocidade_x = 10;
        public int velocidade_y = 10;
        public int velocidade_z = 2;
        public int vel;
        public int position_x_final;
        public int position_y_final;
        //=============================================================================

        public async void Percurso(int largura, int altura)
        {
            if (x <= 975 && x > 675) { x -= 3; } // Espaço aerio
            
            
            if (x <= 675 && x > 46) { x -= 37; } //Pista Ocupada: Pousa
            

            if (x == 46 && y == 55) { x = 35; y = 81; } //Pista Libera

            if (x == 35 && y >= 81 && y < 155) { x = 1200; y = 55; chegada = true; } //Vai para o hangar

            if (x == 1200 && y == 55) { y = 145; x = 622; }

            if (x <= 675 && x > 46) { x -= 37; } //Pista Ocupada: Decola

            if (x == 46 && y == 55) { x = 1200; y = 155; } //Pista Libera

            if (chegada == true)
            {

                for (int k = 0; k <= 9; k++)
                {
                    if ((estacionamento[k].estado == true) & (possible == true))
                    {
                        variavel = k;
                        x = estacionamento[k].position_x + 5;
                        y = estacionamento[k].position_y - 50;
                        estacionamento[k].ident = identidade.ToString();
                        estacionamento[k].estado = false;
                        vel = 0;
                        datachegada = DateTime.Now.ToLongTimeString();
                        estacionar = DateTime.Now;
                        estacionar1 = estacionar.AddSeconds(60);
                        possible = false;
                        estacionamento[k].hora = datachegada;
                        break;
                    }
                }

            }

    }
}