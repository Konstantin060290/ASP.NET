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

namespace ITMO.ADO.ExamTask
    {
    public partial class _Default : Page
        {
        DataClassesDataContext context = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["CheaperTogetherConnectionString"].ConnectionString);
        public int PeopleQuantityProp { get; set; }
        public string DescriptionProp { get; set; }

        public DateTime StartDateProp { get; set; }
        public string EventStartTimeProp { get; set; }
        public DateTime EndDateProp { get; set; }
        public string EventEndTimeProp { get; set; }
        public string TagsProp { get; set; }
        public string StatusProp { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
            {
            var events = from ev in context.Events
                           where ev.EventDateEnd >=DateTime.Now                           
                           select ev;

            if (events.Count()>0)
                {
                LabelEventStatus.Text = "Есть незавершенные события";
                }
            else
                {
                LabelEventStatus.Text = "Все события завершены";
                }
            
            }

        //Работа с интерфейсом
        #region InterfaceWork
        protected void TextBoxPeopleQuantity_TextChanged(object sender, EventArgs e)
            {
            PeopleQuantityProp = Convert.ToInt32(TextBoxPeopleQuantity.Text);
            }
        protected void CalendarStart_SelectionChanged(object sender, EventArgs e)
            {
            StartDateProp = CalendarStart.SelectedDate;
            }

        protected void CalendarEnd_SelectionChanged(object sender, EventArgs e)
            {
            EndDateProp = CalendarEnd.SelectedDate;
            }
        protected void TextBoxDescription_TextChanged(object sender, EventArgs e)
            {
            DescriptionProp = TextBoxDescription.Text;
            }
        

        protected void ButtonCreateEvent_Click(object sender, EventArgs e)
            {
            PeopleQuantityProp = Convert.ToInt32(TextBoxPeopleQuantity.Text);
            DescriptionProp = TextBoxDescription.Text;
            DateTime FullStartDate;
            StartDateProp = CalendarStart.SelectedDate;
            EventStartTimeProp = txtTimeStart.Text;
            FullStartDate = Convert.ToDateTime(StartDateProp.ToString("dd/MM/yyyy") + " " + EventStartTimeProp+":00");
            DateTime FullEndDate;
            EndDateProp = CalendarEnd.SelectedDate.Date;
            EventEndTimeProp = txtTimeEnd.Text;
            FullEndDate = Convert.ToDateTime(EndDateProp.ToString("dd/MM/yyyy") + " " + EventEndTimeProp+":00");
            TagsProp = TextBoxTags.Text;
            if (FullEndDate< DateTime.Now)
                {
                StatusProp = "Завершено";
                }
            else
                {
                StatusProp = "Планируется";
                }
            var newEvent = new Events { PeopleQuantity = PeopleQuantityProp, Description=DescriptionProp, EventDateStart=FullStartDate, EventDateEnd=FullEndDate, Tags=TagsProp, Status=StatusProp};
            context.Events.InsertOnSubmit(newEvent);
            context.Events.Context.SubmitChanges();
            Response.Redirect(Request.RawUrl);
            }


        #endregion InterfaceWork

        protected void GridViewEvents_SelectedIndexChanged(object sender, EventArgs e)
            {

            }
        }
}