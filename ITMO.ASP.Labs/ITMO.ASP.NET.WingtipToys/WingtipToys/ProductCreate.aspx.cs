using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Business;
using WingtipToys.Data;
using WingtipToys.Data.ModelsCodeFirst;

namespace WingtipToys
{
    public partial class ProductCreate : System.Web.UI.Page
    {
        private static readonly IStoreService _service = new StoreService(new SqlProductRepository(), new SqlCategoryRepository());
        private readonly HttpClient _httpClient = new HttpClient() { Timeout = TimeSpan.FromSeconds(5) };

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Category> GetCategories()
        {
            return _service.GetAllCategories().AsQueryable();
        }

        protected void ValidationImageExistence(object source, ServerValidateEventArgs args)
        {
            var request = new HttpRequestMessage(HttpMethod.Head, args.Value);
            try
            {
                using (var response = AsyncHelper.RunSync(() => _httpClient.SendAsync(request)))
                {
                    args.IsValid = response.IsSuccessStatusCode && response.Content.Headers.ContentType.MediaType.StartsWith("image/");
                }
            }
            catch (HttpRequestException)
            {
                args.IsValid = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var product = new Product
                {
                    ProductName = Name.Text,
                    UnitPrice = (double?)decimal.Parse(PriceInput.Text),
                    ImagePath = Path.Text,
                    CategoryID = int.Parse(CategoryList.SelectedValue),
                    Description = Description.Value
                };
                var created = _service.CreateProduct(product);
                LiteralName.Text = created.ProductName;
                LiteralID.Text = created.ProductID.ToString();
            }
        }
        protected override void OnPreRender(EventArgs e)
        {
            if (IsPostBack && IsValid)
            {
                CreateProductForm.Visible = false;
                SuccessBlock.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            
           // var items = document.querySelectorAll("#id1,#id2");

            var product = new Product
                {
                    ProductID = 17,
                    ProductName = Request.Form["myname"], //Find some more
                    Description = "ссссс.",
                    ImagePath = "/Catalog/Images/Thumbs/carmy.png",
                    UnitPrice = (double?)122.95m,
                    CategoryID = 5
                };
                var created = _service.CreateProduct(product);
                LiteralName.Text = created.ProductName;
                LiteralID.Text = created.ProductID.ToString();
            
        }
    }


}