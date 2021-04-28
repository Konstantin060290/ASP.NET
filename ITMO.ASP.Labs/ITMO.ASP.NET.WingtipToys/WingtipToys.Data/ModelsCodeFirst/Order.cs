using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WingtipToys.Data.ModelsCodeFirst
{
    public partial class Order
    {
        public Order()
        {
            Products = new HashSet<Product>();
        }

        public int OrderID { get; set; }
        public string DelieveryAddress { get; set; }
        public string PostalCode { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public ICollection<Product> Products { get; set; }
    }

}
