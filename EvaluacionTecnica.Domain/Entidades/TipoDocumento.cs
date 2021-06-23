using System.ComponentModel.DataAnnotations;

namespace EvaluacionTecnica.Domain.Entidades
{
    public class TipoDocumento
    {
        public int Id { get; set; }

        [StringLength(50)]
        [Required]
        public string Descripcion { get; set; }
    }
}
