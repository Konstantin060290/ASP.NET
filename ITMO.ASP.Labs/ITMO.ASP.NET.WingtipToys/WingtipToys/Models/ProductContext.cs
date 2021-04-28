using System.Data.Entity;
namespace WingtipToys.Models
{
  public class ProductContext : DbContext
  {
    public ProductContext()
      : base("WingtipToys")
    {
    }
    public DbSet<CategoryEntity> Categories { get; set; }
    public DbSet<ProductEntity> Products { get; set; }
  }
}