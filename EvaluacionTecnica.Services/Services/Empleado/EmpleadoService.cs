using System;
using System.Collections.Generic;
using System.Linq;
using EvaluacionTecnica.Domain.Entidades;
using EvaluacionTecnica.Services.Services.Log;

namespace EvaluacionTecnica.Services.Services.Empleado
{
    public class EmpleadoService : IEmpleadoService
    {
        private EvaluacionTecnicaContext _context = new EvaluacionTecnicaContext();
        private ILoggerService _loggerService;

        public EmpleadoService()
        {
            _loggerService = new LoggerService();
        }
        public List<Domain.Entidades.Empleado> Listar()
        {
            try
            {
                return this._context.Empleados.ToList();
            }
            catch (System.Exception e)
            {
               _loggerService.Registrar("Ocurrió un error listando empleados. Exceplción: " + e);

                return new List<Domain.Entidades.Empleado>();
            }
        }

        public List<Domain.Entidades.Empleado> ListarPorApellido(string apellido)
        {
            try
            {
                return this._context.Empleados.Where(x=> x.Apellido.ToLower().Contains(apellido.ToLower())).ToList();
            }
            catch (System.Exception e)
            {
                _loggerService.Registrar("Ocurrió un error listando empleados por apellido. Exceplción: " + e);

                return new List<Domain.Entidades.Empleado>();
            }
        }
    }
}
