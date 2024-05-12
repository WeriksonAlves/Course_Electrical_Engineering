using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T3_96708_ELT479
{
    public class Class_2
    {
        public Boolean estado;
        public int position_x;
        public int position_y;
        public string ident;
        public string hora;

        public void rehora()
        {
            if (estado == true) { hora = "HORÁRIO"; ident = "ID"; }
        }


    }
}
