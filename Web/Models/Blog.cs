//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Blog
    {
        public int ID { get; set; }
        public Nullable<int> LanguageID { get; set; }
        public string Title { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public string Content { get; set; }
        public string ShortContent { get; set; }
        public string DefaultImage { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> StatusID { get; set; }
        public Nullable<bool> IsHomePage { get; set; }
        public Nullable<int> InsertUserID { get; set; }
        public Nullable<System.DateTime> InsertDate { get; set; }
        public Nullable<int> DeleteUserID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
    }
}