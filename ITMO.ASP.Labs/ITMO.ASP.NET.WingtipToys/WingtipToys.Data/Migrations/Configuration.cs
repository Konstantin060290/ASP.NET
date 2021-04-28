namespace WingtipToys.Data.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<WingtipToys.Data.ModelsCodeFirst.WingtipToysModel>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            ContextKey = "WingtipToys.Data.ModelsCodeFirst.WingtipToysModel";
        }

        protected override void Seed(WingtipToys.Data.ModelsCodeFirst.WingtipToysModel context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data.
        }
    }
}
