//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyKho_MVVM.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Output
    {
        public string Id { get; set; }
        public Nullable<System.DateTime> DateOutput { get; set; }
    
        public virtual OutputInfo OutputInfo { get; set; }
    }
}
