//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Hijsmiddel
    {
        public int Id { get; set; }
        public Nullable<System.DateTime> datum_gekeurd { get; set; }
        public Nullable<System.DateTime> datum_herkeuring { get; set; }
        public string reg_nr { get; set; }
        public string certi_nr { get; set; }
        public string soort { get; set; }
        public string status { get; set; }
        public string certificaat { get; set; }
        public Nullable<bool> stevens { get; set; }
    }
}
