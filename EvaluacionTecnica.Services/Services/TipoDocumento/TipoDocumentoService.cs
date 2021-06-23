using EvaluacionTecnica.Domain.Entidades;
using EvaluacionTecnica.Services.Services.Log;
using System.Linq;

namespace EvaluacionTecnica.Services.Services.TipoDocumento
{
    public class TipoDocumentoService : ITipoDocumentoService
    {
        private EvaluacionTecnicaContext _context = new EvaluacionTecnicaContext();
        private ILoggerService _loggerService;

        public TipoDocumentoService()
        {
            _loggerService = new LoggerService();
        }

        public Domain.Entidades.TipoDocumento ObtenerPorId(int? id)
        {
            try
            {
                return this._context.TiposDocumento.Where(x => x.Id == id).FirstOrDefault();
            }
            catch (System.Exception e)
            {
                _loggerService.Registrar("Ocurrió un error obteniendo tipo de documento por id. Exceplción: " + e);

                return new Domain.Entidades.TipoDocumento();
            }
        }
    }
}
