<%@ Page Title="Add category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryCreate.aspx.cs" Inherits="WingtipToys.CategoryCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Add new category</h1>
    <div runat="server" id="CreateCategoryForm">
        <asp:Label ID="LabelName" runat="server" AssociatedControlID="Name" Text="Name:"></asp:Label>
        <br />
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="Name"
            ErrorMessage="Category name is required" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CategoryUniqueValidator" runat="server" ErrorMessage="Category already exists"
            ControlToValidate="Name" Display="Dynamic" OnServerValidate="ValidateUnique"></asp:CustomValidator>
        <br />
        <asp:Label ID="LabelDescription" runat="server" Text="Description:" Font-Bold="True"></asp:Label>
        <br />
        <textarea id="Description" name="S1" runat="server"></textarea>
        <br />
        <asp:RegularExpressionValidator ID="DescriptionLengthValidator" runat="server" ControlToValidate="Description"
            ErrorMessage="Description should be maximum 500 symbols long"
            ValidationExpression="^.{0,500}$"></asp:RegularExpressionValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Create category" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <div runat="server" id="SuccessBlock" visible="False">
        <h2>New category 
            <b>
                <asp:Literal ID="MesageCategoryName" runat="server">
                </asp:Literal>&nbsp;

            </b>was successfully added to our store. You could 
            <a href="~/ProductList" runat="server">check catalog</a>

        </h2>
    </div>


</asp:Content>
