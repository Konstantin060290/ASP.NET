<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberPage.aspx.cs" Inherits="ITMO.ADO.ExamTask.MemberPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/Site.css" type="text/css" runat="server" rel="stylesheet" />
     
    <div style="grid-row: 1/15; grid-column: 7/7; width: 1px; background-color: darkgray; height: 135%;"></div>
    <asp:GridView style="position:absolute; left: 45%; top: 8%;" Width="50%" class="gridGridViewEvents" ID="GridViewEvents" runat="server" RowHeaderColumn="События" DataSourceID="SqlDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                 CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" EnableTheming="True" OnSelectedIndexChanged="GridViewEvents_SelectedIndexChanged" GridLines="Horizontal" DataKeyNames="EnventId" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="EnventId" HeaderText="ID события" InsertVisible="False" ReadOnly="True" SortExpression="EnventId" />
                        <asp:BoundField DataField="PeopleQuantity" HeaderText="Количество участников" SortExpression="PeopleQuantity" />
                        <asp:BoundField DataField="Description" HeaderText="Описание" SortExpression="Description" />
                        <asp:BoundField DataField="EventDateStart" HeaderText="Дата начала события" SortExpression="EventDateStart" />
                        <asp:BoundField DataField="EventDateEnd" HeaderText="Дата окончания события" SortExpression="EventDateEnd" />
                        <asp:BoundField DataField="Tags" HeaderText="Тэги" SortExpression="Tags" />
                        <asp:BoundField DataField="Status" HeaderText="Статус события" SortExpression="Status" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>    
    <asp:Label ID="NameLable" runat="server" Text="Имя:" style="position:absolute; left: 20%; top: 10%;" Width="20%" ></asp:Label>
    <asp:TextBox ID="TextBoxName" runat="server"  style="position:absolute; left: 20%; top: 15%;" Width="20%" OnTextChanged="TextBoxName_TextChanged" ></asp:TextBox>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CheaperTogetherConnectionString %>" SelectCommand="SELECT * FROM [Events]"></asp:SqlDataSource>
    <asp:Button ID="InvRequestButton" runat="server" Text="Отправить заявку на участие" style="position:absolute; left: 20%; top: 20%;" Width="20%" OnClick="InvRequestButton_Click"/>
    <asp:TextBox ID="txtSearch" runat="server" style="position:absolute; left: 50%; top: 40%;" Width="15%" ></asp:TextBox>
    <asp:Button Text="Поиск по тегу" runat="server" OnClick="Search" style="position:absolute; left: 70%; top: 40%;" Width="15%" ></asp:Button>
   
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>


