using System.Collections.Generic;

namespace EvaluacionTecnica.Services.Services.Empleado
{
    public interface IEmpleadoService
    {
        List<Domain.Entidades.Empleado> Listar();

        List<Domain.Entidades.Empleado> ListarPorApellido(string apellido);
    }
}
