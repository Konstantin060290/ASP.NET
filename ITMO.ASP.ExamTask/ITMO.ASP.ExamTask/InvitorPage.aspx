<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvitorPage.aspx.cs" Inherits="ITMO.ADO.ExamTask._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/Site.css" type="text/css" runat="server" rel="stylesheet" />
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CheaperTogetherConnectionString %>" SelectCommand="SELECT * FROM [Events]"></asp:SqlDataSource>
    <div class="grid">
        <asp:Label class="gridLabelQuantity" ID="LabelPeopleQuantity" runat="server" Text="Количество человек:"></asp:Label>
        <asp:TextBox class="gridTextBoxQuantity" ID="TextBoxPeopleQuantity" runat="server" OnTextChanged="TextBoxPeopleQuantity_TextChanged"></asp:TextBox>
        <asp:Label class="gridLabelDescription" ID="LabelDescription" runat="server" Text="Описание:"></asp:Label>
        <asp:TextBox class="gridTextAreaDescription" ID="TextBoxDescription" runat="server" OnTextChanged="TextBoxDescription_TextChanged" TextMode="MultiLine"></asp:TextBox>
        <asp:Label class="gridLabelPhoto" ID="LabelPhoto" runat="server" Text="Фото:"></asp:Label>
        <input class="gridFilePhoto" id="FilePhoto" title="Фото" type="file">
        <asp:Label class="gridLabelDateStart" ID="LabelDateStart" runat="server" Text="Дата начала:"></asp:Label>
        <asp:Calendar class="gridCalendarStart" ID="CalendarStart" runat="server" OnSelectionChanged="CalendarStart_SelectionChanged"></asp:Calendar>
        <asp:Label ID="LabelEventStatus" runat="server" Text="LabelEventStatus" style="position:absolute; left: 70%; top: 8%;"></asp:Label>
        <asp:Label class="gridLabelTags" ID="LabelTags" runat="server" Text="Тэги события:"></asp:Label>
        <asp:TextBox  class="gridTextBoxTags" ID="TextBoxTags" runat="server"></asp:TextBox>
        <asp:Label class="gridLabelDateEnd" ID="LabelDateEnd" runat="server" Text="Дата окончания:"></asp:Label>
        <asp:Calendar class="gridCalendarEnd" ID="CalendarEnd" runat="server" OnSelectionChanged="CalendarEnd_SelectionChanged"></asp:Calendar>
        <asp:Label ID="RequestsLabel" runat="server" style="position:absolute; left: 45%; top: 50%;" Width="30%">Запросы на участие в событии:</asp:Label>
        <asp:GridView ID="GridViewRequest" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1"
            style="position:absolute; left: 45%; top: 60%;" Width="30%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="RequestEventId" HeaderText="ID события" SortExpression="RequestEventId" />
                <asp:BoundField DataField="MemberName" HeaderText="Имя участника" SortExpression="MemberName" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CheaperTogetherConnectionString %>" SelectCommand="SELECT * FROM [RequestsForEvents]"></asp:SqlDataSource>
        <asp:Button class="gridButtonCreateEvent" ID="ButtonCreateEvent" runat="server" Text="Создать событие" OnClick="ButtonCreateEvent_Click"/>
        <div class="vertical-line"></div> 

        <asp:Label class="gridLabelTimeStart" ID="LabelTimeStart" runat="server" Text="Время начала (в 24 часовом формате):" style="
            grid-row: 13/13; grid-column: 1/4;"></asp:Label>
        <asp:TextBox class="gridtxtTimeStart" ID="txtTimeStart" runat="server" style="grid-row: 14/14;
    grid-column: 1/2;"></asp:TextBox>
        <%--  <asp:DropDownList ID="ddlAmPmEnd" runat="server" style="grid-row: 14/14;
    grid-column: 5/6;">
            <asp:ListItem Selected="True">AM</asp:ListItem>
            <asp:ListItem Selected="False">PM</asp:ListItem>
        </asp:DropDownList>--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTimeStart" runat="server" ControlToValidate="txtTimeStart" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="TimeStartValidator" runat="server"
            ControlToValidate="txtTimeStart" Display="Dynamic" ErrorMessage="Invalid Time.  Enter time in a valid format.  Example: 12:30 or 5:00"
            ValidationExpression="^(1[0-2]|[1-9]):[0-5][0-9]$" EnableClientScript="False"></asp:RegularExpressionValidator>
           
        
            <asp:Label class="gridLabelTimeEnd" ID="LabelTimeEnd" runat="server" Text="Время окончания (в 24 часовом формате):" style="
            grid-row: 13/13; grid-column: 4/7;"></asp:Label>
        <asp:TextBox class="gridtxtTimeEnd" ID="txtTimeEnd" runat="server" style="grid-row: 14/14;
    grid-column: 4/5;"></asp:TextBox>
      <%--  <asp:DropDownList ID="ddlAmPmEnd" runat="server" style="grid-row: 14/14;
    grid-column: 5/6;">
            <asp:ListItem Selected="True">AM</asp:ListItem>
            <asp:ListItem Selected="False">PM</asp:ListItem>
        </asp:DropDownList>--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTimeEnd" runat="server" ControlToValidate="txtTimeEnd" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="TimeEndValidator" runat="server"
            ControlToValidate="txtTimeEnd" Display="Dynamic" ErrorMessage="Invalid Time.  Enter time in a valid format.  Example: 12:30 or 5:00"
            ValidationExpression="^(1[0-2]|[1-9]):[0-5][0-9]$" EnableClientScript="False"></asp:RegularExpressionValidator>
    </div>
    

    <asp:GridView style="position:absolute; left: 45%; top: 12%;" Width="50%" class="gridGridViewEvents" ID="GridViewEvents" runat="server" RowHeaderColumn="События" DataSourceID="SqlDataSource" 
        DataKeyNames="EnventId" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                 CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" EnableTheming="True" GridLines="Horizontal" AllowSorting="True" OnSelectedIndexChanged="GridViewEvents_SelectedIndexChanged" >
                    <Columns>
                        <asp:BoundField DataField="EnventId" HeaderText="ID события" InsertVisible="False" ReadOnly="True" SortExpression="EnventId" />
                        <asp:BoundField DataField="PeopleQuantity" HeaderText="Осталось мест" SortExpression="PeopleQuantity" />
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
    

  
</asp:Content>
