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
    
    public partial class Verfpomp
    {
        public int Id { get; set; }
        public Nullable<System.DateTime> datum_gekeurd { get; set; }
        public Nullable<System.DateTime> datum_herkeuring { get; set; }
        public string code_nr { get; set; }
        public Nullable<int> bouwjaar { get; set; }
        public string leverancier { get; set; }
        public string merk { get; set; }
        public string benaming { get; set; }
        public string stamkaart { get; set; }
    }
}
