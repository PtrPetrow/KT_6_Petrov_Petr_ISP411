//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace petShopPetrou.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int id { get; set; }
        public int idOrderProduct { get; set; }
        public int idArt { get; set; }
        public int count { get; set; }
    
        public virtual OrderProduct OrderProduct { get; set; }
        public virtual Product Product { get; set; }
    }
}