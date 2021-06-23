using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EvaluacionTecnica.Domain.Entidades
{
    public class Empleado
    {
        public int Id { get; set; }

        [Column(TypeName = "nchar")]
        [StringLength(5, ErrorMessage = "La cantidad máxima de caracteres permitida es 5")]
        [Required]
        public string Codigo { get; set; }

        [StringLength(50, ErrorMessage = "La cantidad máxima de caracteres permitida es 50")]
        [Required]
        public string Apellido { get; set; }

        [StringLength(50, ErrorMessage = "La cantidad máxima de caracteres permitida es 50")]
        [Required]
        public string Nombre { get; set; }

        [Column(TypeName = "date")]
        [Display(Name = "Fecha de Alta")]
        public DateTime? FechaAlta { get; set; }

        public int? TipoDocumentoId { get; set; }
        public virtual TipoDocumento TipoDocumento { get; set; }

        [Display(Name = "Nº de Documento")]
        public int? NumeroDocumento { get; set; }
    }
}
