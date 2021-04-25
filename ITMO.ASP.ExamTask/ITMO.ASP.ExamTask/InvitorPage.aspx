﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvitorPage.aspx.cs" Inherits="ITMO.ADO.ExamTask._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/Site.css" type="text/css" runat="server" rel="stylesheet" />
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CheaperTogetherConnectionString %>" SelectCommand="SELECT * FROM [Events]"></asp:SqlDataSource>
    <div class="grid">
        <asp:Label class="gridLabelQuantity" ID="LabelPeopleQuantity" runat="server" Text="Количество человек:"></asp:Label>
        <asp:TextBox class="gridTextBoxQuantity" ID="TextBoxPeopleQuantity" runat="server" OnTextChanged="TextBoxPeopleQuantity_TextChanged"></asp:TextBox>
        <asp:Label class="gridLabelDescription" ID="LabelDescription" runat="server" Text="Описание:"></asp:Label>
        <asp:TextBox class="gridTextAreaDescription" ID="TextBoxDescription" runat="server"></asp:TextBox>
        <asp:Label class="gridLabelPhoto" ID="LabelPhoto" runat="server" Text="Фото:"></asp:Label>
        <input class="gridFilePhoto" id="FilePhoto" title="Фото" type="file">
        <asp:Label class="gridLabelDateStart" ID="LabelDateStart" runat="server" Text="Дата начала:"></asp:Label>
        <asp:Calendar class="gridCalendarStart" ID="CalendarStart" runat="server" OnSelectionChanged="CalendarStart_SelectionChanged"></asp:Calendar>
        <asp:Label class="gridLabelTags" ID="LabelTags" runat="server" Text="Тэги события:"></asp:Label>
        <asp:TextBox  class="gridTextBoxTags" ID="TextBoxTags" runat="server"></asp:TextBox>
        <asp:Label class="gridLabelDateEnd" ID="LabelDateEnd" runat="server" Text="Дата окончания:"></asp:Label>
        <asp:Calendar class="gridCalendarEnd" ID="CalendarEnd" runat="server" OnSelectionChanged="CalendarEnd_SelectionChanged"></asp:Calendar>
        <asp:Button class="gridButtonCreateEvent" ID="ButtonCreateEvent" runat="server" Text="Создать событие" OnClick="ButtonCreateEvent_Click"/>
        <div class="vertical-line"></div>    
    </div>
    

    <asp:GridView style="position:absolute; left: 45%; top: 8%;" Width="50%" class="gridGridViewEvents" ID="GridViewEvents" runat="server" RowHeaderColumn="События" DataSourceID="SqlDataSource" 
        DataKeyNames="EnventId" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                 CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" EnableTheming="True" AutoGenerateSelectButton="True" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="EnventId" HeaderText="EnventId" InsertVisible="False" ReadOnly="True" SortExpression="EnventId" />
                        <asp:BoundField DataField="PeopleQuantity" HeaderText="PeopleQuantity" SortExpression="PeopleQuantity" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="EventDateStart" HeaderText="EventDateStart" SortExpression="EventDateStart" />
                        <asp:BoundField DataField="EventDateEnd" HeaderText="EventDateEnd" SortExpression="EventDateEnd" />
                        <asp:BoundField DataField="Tags" HeaderText="Tags" SortExpression="Tags" />
                        <asp:BoundField DataField="FirstNameUser" HeaderText="FirstNameUser" SortExpression="FirstNameUser" />
                        <asp:BoundField DataField="LastNameUser" HeaderText="LastNameUser" SortExpression="LastNameUser" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView> 

</asp:Content>
