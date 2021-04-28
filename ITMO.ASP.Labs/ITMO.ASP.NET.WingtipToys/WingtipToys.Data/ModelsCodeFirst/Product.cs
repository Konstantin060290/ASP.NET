namespace WingtipToys.Data.ModelsCodeFirst
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product
    {

        public Product()
        {
            Orders = new HashSet<Order>();
        }

        public int ProductID { get; set; }

        [Required]
        [StringLength(100)]
        public string ProductName { get; set; }

        [Required]
        public string Description { get; set; }

        public string ImagePath { get; set; }

        public double? UnitPrice { get; set; }

        public int? CategoryID { get; set; }

        public virtual Category Category { get; set; }

        public int? ManufacturerID { get; set; }

        public virtual Manufacturer Manufacturer { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
