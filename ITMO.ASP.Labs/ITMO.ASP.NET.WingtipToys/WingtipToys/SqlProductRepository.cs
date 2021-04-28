using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WingtipToys.Data;
using WingtipToys.Data.ModelsCodeFirst;

namespace WingtipToys
{
    public class SqlProductRepository : IProductRepository
    {

        public Product Create(Product product)
        {
            using (var ctx = new WingtipToysModel())
            {
                var added = ctx.Products.Add(product);
                ctx.SaveChanges();
                return added;
            }
        }

        public Product Update(Product product)
        {
            using (var ctx = new WingtipToysModel())
            {
                var existing = ctx.Products.SingleOrDefault(x => x.ProductID == product.ProductID);
                if (existing == null)
                {
                    return null;
                }
                existing.CategoryID = product.CategoryID;
                existing.Description = product.Description;
                existing.ImagePath = product.ImagePath;
                existing.ProductName = product.ProductName;
                existing.UnitPrice = product.UnitPrice;
                ctx.SaveChanges();
                return existing;
            }
        }

        public bool Delete(int productId)
        {
            using (var ctx = new WingtipToysModel())
            {
                var existing = ctx.Products.SingleOrDefault(x => x.ProductID == productId);
                if (existing == null)
                {
                    return false;
                }
                ctx.Products.Remove(existing);
                ctx.SaveChanges();
                return true;
            }
        }

        public Product Get(int productId)
        {
            using (var ctx = new WingtipToysModel())
            {
                return ctx.Products.SingleOrDefault(x => x.ProductID == productId);
            }
        }

        public IEnumerable<Product> GetByCategoryId(int categoryId)
        {
            using (var ctx = new WingtipToysModel())
            {
                return ctx.Products.Where(x => x.CategoryID == categoryId).ToList();
            }
        }

        public IEnumerable<Product> GetAll()
        {
            using (var ctx = new WingtipToysModel())
            {
                return ctx.Products.ToList();
            }
        }

    }
}