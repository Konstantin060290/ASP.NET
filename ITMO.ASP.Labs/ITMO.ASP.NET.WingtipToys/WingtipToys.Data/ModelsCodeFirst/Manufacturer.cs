using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WingtipToys.Data.ModelsCodeFirst
{
    public partial class Manufacturer
    {
        public Manufacturer()
        {
            Products = new HashSet<Product>();
        }
        public int ManufacturerID { get; set; }

        [Required]
        [StringLength(100)]
        [Index("IX_UniqueManufacturerName", IsUnique = true)]
        public string ManufacturerName { get; set; }

        [StringLength(100)]
        public string CountryOfOrigin { get; set; }

        [Required]
        public DateTime Since { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }

}
