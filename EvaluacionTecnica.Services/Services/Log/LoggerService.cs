using System;

namespace EvaluacionTecnica.Services.Services.Log
{
    public class LoggerService : ILoggerService
    {
        public void Registrar(string detalle)
        {
            Console.Write(detalle);
        }
    }
}
