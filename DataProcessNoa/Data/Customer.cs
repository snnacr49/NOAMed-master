//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataProcessNoa.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Customer
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string ShopName { get; set; }
        public string PhoneNo { get; set; }
        public string AddressInfo { get; set; }
        public bool IsActive { get; set; }
        public string InsertUserName { get; set; }
        public System.DateTime InsertTime { get; set; }
        public string DeleteUserName { get; set; }
        public Nullable<System.DateTime> DeleteTime { get; set; }
    }
}