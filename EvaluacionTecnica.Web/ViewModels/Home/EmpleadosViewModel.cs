using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EvaluacionTecnica.Web.ViewModels.Home
{
    public class EmpleadosViewModel
    {
        public string Busqueda { get; set; }
        public List<EmpleadoParaMostrar> Empleados { get; set; }

        public EmpleadosViewModel()
        {
            Busqueda = string.Empty;
            Empleados = new List<EmpleadoParaMostrar>();
        }
    }

    public class EmpleadoParaMostrar
    {
        public string Codigo { get; set; }

        public string Apellido { get; set; }

        public string Nombre { get; set; }

        public string FechaAlta { get; set; }

        public string TipoDocumento { get; set; }

        public string NumeroDocumento { get; set; }
    }

}