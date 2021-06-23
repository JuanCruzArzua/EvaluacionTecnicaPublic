namespace EvaluacionTecnica.Services.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialMigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Empleado",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Codigo = c.String(nullable: false, maxLength: 5, fixedLength: true),
                        Apellido = c.String(nullable: false, maxLength: 50),
                        Nombre = c.String(nullable: false, maxLength: 50),
                        FechaAlta = c.DateTime(storeType: "date"),
                        TipoDocumentoId = c.Int(),
                        NumeroDocumento = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.TipoDocumento", t => t.TipoDocumentoId)
                .Index(t => t.TipoDocumentoId);
            
            CreateTable(
                "dbo.TipoDocumento",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Descripcion = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Empleado", "TipoDocumentoId", "dbo.TipoDocumento");
            DropIndex("dbo.Empleado", new[] { "TipoDocumentoId" });
            DropTable("dbo.TipoDocumento");
            DropTable("dbo.Empleado");
        }
    }
}
