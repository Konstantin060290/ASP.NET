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

namespace ITMO.ADO.ExamTask
    {
    public partial class _Default : Page
        {

        public int PeopleQuantityProp { get; set; }
        public string DescriptionProp { get; set; }

        public DateTime StartDateProp { get; set; }
        public DateTime EndDateProp { get; set; }
        public string TagsProp { get; set; }

        
        protected void Page_Load(object sender, EventArgs e)
            {

            }

        //Работа с интерфейсом
        #region InterfaceWork
        protected void TextBoxPeopleQuantity_TextChanged(object sender, EventArgs e)
            {
                PeopleQuantityProp = Convert.ToInt32(TextBoxPeopleQuantity.Text);           
            }
        protected void CalendarStart_SelectionChanged(object sender, EventArgs e)
            {
            StartDateProp = Convert.ToDateTime(CalendarStart.SelectedDate);
            }

        protected void CalendarEnd_SelectionChanged(object sender, EventArgs e)
            {
            EndDateProp = Convert.ToDateTime(CalendarEnd.SelectedDate);
            }
        protected void ButtonCreateEvent_Click(object sender, EventArgs e)
            {
            var context = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["CheaperTogetherConnectionString"].ConnectionString);
            var newEvent = new Events { PeopleQuantity = PeopleQuantityProp, Description=DescriptionProp, EventDateStart= StartDateProp, EventDateEnd= EndDateProp};
            context.Events.InsertOnSubmit(newEvent);
            context.Events.Context.SubmitChanges();           
            }


        #endregion InterfaceWork
        }
}