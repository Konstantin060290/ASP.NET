using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Configuration;
using System.Data.Linq;
using System.IO;
using System.Text.RegularExpressions;

namespace ITMO.ADO.ExamTask
    {
    
public partial class MemberPage : System.Web.UI.Page
        {
        DataClassesDataContext context = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["CheaperTogetherConnectionString"].ConnectionString);
        public string NameProp {get;set;}
        public int EventIdProp { get; set; }
    
        protected void Page_Load(object sender, EventArgs e)
            {
            //if (!this.IsPostBack)
            //    {
            //    this.BindGrid();
            //    }
            }
        protected void Search(object sender, EventArgs e)
            {
            //this.BindGrid();
            }

        //private void BindGrid()
        //    {
        //    string constr = ConfigurationManager.ConnectionStrings["CheaperTogetherConnectionString"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //        {
        //        using (SqlCommand cmd = new SqlCommand())
        //            {
        //            cmd.CommandText = "SELECT Tags FROM Events WHERE Tags LIKE '%' + @Tag + '%'";
        //            cmd.Connection = con;
        //            cmd.Parameters.AddWithValue("@Tag", txtSearch.Text.Trim());
        //            DataTable dt = new DataTable();
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //                {
        //                sda.Fill(dt);
        //                GridViewEvents.DataSource = dt;
        //                GridViewEvents.DataBind();
        //                }
        //            }
        //        }
        //    }

        //protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        //    {
        //    GridViewEvents.PageIndex = e.NewPageIndex;
        //    this.BindGrid();
        //    }


                protected void GridViewEvents_SelectedIndexChanged(object sender, EventArgs e)
            {
            
            }

        protected void InvRequestButton_Click(object sender, EventArgs e)
            {
            EventIdProp = (int)GridViewEvents.SelectedDataKey.Values["EnventId"];
            NameProp = TextBoxName.Text;
            var newRequest = new RequestsForEvents { RequestEventId = EventIdProp, MemberName = NameProp };
            context.RequestsForEvents.InsertOnSubmit(newRequest);
            context.RequestsForEvents.Context.SubmitChanges();
            Response.Redirect(Request.RawUrl);
            }
        
        protected void TextBoxName_TextChanged(object sender, EventArgs e)
            {

            }
        }
    }