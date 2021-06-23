using EvaluacionTecnica.Domain.Entidades;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace EvaluacionTecnica.Services
{
    public class EvaluacionTecnicaContext : DbContext
    {
        public EvaluacionTecnicaContext() : base ("name=EvaluacionTecnicaContext")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public virtual DbSet<Empleado> Empleados { get; set; }
        public virtual DbSet<TipoDocumento> TiposDocumento { get; set; }
    }
}
