using EvaluacionTecnica.Services.Services.Empleado;
using EvaluacionTecnica.Services.Services.TipoDocumento;
using EvaluacionTecnica.Web.ViewModels.Home;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EvaluacionTecnica.Web.Controllers
{
    public class HomeController : Controller
    {
        private IEmpleadoService _empleadoService;
        private ITipoDocumentoService _tipoDocumentoService;
        public HomeController()
        {
            _empleadoService = new EmpleadoService();
            _tipoDocumentoService = new TipoDocumentoService();
        }
        public ActionResult Index()
        {
            var viewModel = new EmpleadosViewModel();
            var empleados = _empleadoService.Listar();

            viewModel = Map(empleados);

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Filtrar(EmpleadosViewModel empleado)
        {
            var viewModel = new EmpleadosViewModel(); 

            if (string.IsNullOrEmpty(empleado.Busqueda))
            {
                return View("Index", viewModel);
            }

            var empleados = _empleadoService.ListarPorApellido(empleado.Busqueda);

            viewModel = Map(empleados);
            viewModel.Busqueda = string.Empty;
            return View("Index", viewModel);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        private EmpleadosViewModel Map(List<Domain.Entidades.Empleado> empleados)
        {
            var viewModel = new EmpleadosViewModel();

            foreach (var empleado in empleados)
            {
                viewModel.Empleados.Add(new EmpleadoParaMostrar()
                {
                    Codigo = empleado.Codigo,
                    Apellido = empleado.Apellido,
                    Nombre = empleado.Nombre,
                    FechaAlta = empleado.FechaAlta != null ? empleado.FechaAlta.Value.ToString("dd/MM/yyyy") : string.Empty,
                    NumeroDocumento = empleado.NumeroDocumento != null ? empleado.NumeroDocumento.ToString() : string.Empty,
                    TipoDocumento = empleado.TipoDocumentoId != null ? _tipoDocumentoService.ObtenerPorId(empleado.TipoDocumentoId).Descripcion : string.Empty
                });
            }

            return viewModel;
        }
    }
}