using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WingtipToys.Data;
using WingtipToys.Data.ModelsCodeFirst;

namespace WingtipToys
{
    public class SqlCategoryRepository : ICategoryRepository
    {
        public Category Create(Category category)
        {
            using (var ctx = new WingtipToysModel())
            {
                var added = ctx.Categories.Add(category);
                ctx.SaveChanges();
                return added;
            }
        }


        public bool Delete(int categoryId)
        {
            using (var ctx = new WingtipToysModel())
            {
                var existing = ctx.Categories.SingleOrDefault(x => x.CategoryID == categoryId);
                if (existing == null)
                {
                    return false;
                }
                ctx.Categories.Remove(existing);
                ctx.SaveChanges();
                return true;
            }
        }


        public Category Get(string categoryName)
        {
            using (var ctx = new WingtipToysModel())
            {
                return ctx.Categories.SingleOrDefault(x => x.CategoryName.Equals(categoryName, StringComparison.InvariantCultureIgnoreCase));
            }
        }

        public Category Get(int categoryId)
        {
            using (var ctx = new WingtipToysModel())
            {
                return ctx.Categories.SingleOrDefault(x => x.CategoryID == categoryId);
            }
        }


        public IEnumerable<Category> GetAll()
        {
            using (var ctx = new WingtipToysModel())
            {
                return ctx.Categories.ToList();
            }
        }


    

        public Category Update(Category category)
        {
            using (var ctx = new WingtipToysModel())
            {
                var existing = ctx.Categories.SingleOrDefault(x => x.CategoryID == category.CategoryID);
                if (existing == null)
                {
                    return null;
                }
                existing.Description = category.Description;
                existing.CategoryName = category.CategoryName;
                ctx.SaveChanges();
                return existing;
            }
        }

    }

}