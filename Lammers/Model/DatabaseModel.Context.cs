﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Lammers.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Onderhoud_calibratieEntities : DbContext
    {
        public Onderhoud_calibratieEntities()
            : base("name=Onderhoud_calibratieEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Bovenloopkraan> Bovenloopkraan { get; set; }
        public virtual DbSet<Hefmiddel> Hefmiddel { get; set; }
        public virtual DbSet<Hijsmiddel> Hijsmiddel { get; set; }
        public virtual DbSet<Ladder> Ladder { get; set; }
        public virtual DbSet<Lasapparaat> Lasapparaat { get; set; }
        public virtual DbSet<Meetmiddel> Meetmiddel { get; set; }
        public virtual DbSet<Oplegger> Oplegger { get; set; }
        public virtual DbSet<Valbeveiliging> Valbeveiliging { get; set; }
        public virtual DbSet<Verfpomp> Verfpomp { get; set; }
    }
}
