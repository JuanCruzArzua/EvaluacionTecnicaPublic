using System.Collections.Generic;

namespace EvaluacionTecnica.Services.Services.TipoDocumento
{
    public interface ITipoDocumentoService
    {
        Domain.Entidades.TipoDocumento ObtenerPorId(int? id);
        List<Domain.Entidades.TipoDocumento> Listar();
    }
}
