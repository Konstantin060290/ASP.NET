<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductCreate.aspx.cs" Inherits="WingtipToys.ProductCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add new product</h1>
    <div runat="server" id="CreateProductForm">
        <asp:Label ID="LabelName" runat="server" AssociatedControlID="Name" Text="Name:"></asp:Label>
        <br />
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="Name"
            ErrorMessage="Product name is required"
            ForeColor="red"
            Display="Dynamic">
        </asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="LabelPrice" runat="server" AssociatedControlID="PriceInput" Text="Price:" Font-Bold="True"></asp:Label>
        <br />
        <asp:TextBox ID="PriceInput" runat="server"></asp:TextBox>
        <asp:RangeValidator
            Type="Currency"
            ID="PriceValidator" runat="server"
            ControlToValidate="PriceInput"
            ErrorMessage="Price should be grater then zero. Maximum price is 600$"
            ForeColor="red"
            MaximumValue="600,00" MinimumValue="0,10"
            Display="Dynamic">
        </asp:RangeValidator>
        <asp:RequiredFieldValidator
            ID="PriceRequiredValidator"
            runat="server"
            ControlToValidate="PriceInput"
            EnableTheming="True"
            ErrorMessage="Price is required"
            Display="Dynamic">
        </asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="LabelCategory" runat="server" Text="Category:" Font-Bold="True"></asp:Label>
        <br />
        <asp:DropDownList
            ID="CategoryList"
            runat="server"
            DataTextField="CategoryName"
            DataValueField="CategoryID"
            ItemType="WingtipToys.Data.Models.Category"
            SelectMethod="GetCategories">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="CategoryValidator" runat="server" ControlToValidate="CategoryList"
            ErrorMessage="Product category is required" Display="Dynamic"></asp:RequiredFieldValidator>

        <br />
        <asp:Label ID="LabelDecription" runat="server" Text="Description:" Font-Bold="True"></asp:Label>
        <br />
        <textarea id="Description" name="S1" runat="server"></textarea>
        <asp:RegularExpressionValidator ID="DescriptionLengthValidator" runat="server" ControlToValidate="Description"
            ErrorMessage="Description should be maximum 500 symbols long"
            ValidationExpression="^.{0,500}$"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator
            ID="WordsValidator"
            runat="server"
            ErrorMessage="it should not less then 3 words, and not more than 150"
            ValidationExpression="^\s*(\S+\s+|\S+$){3,150}$"
            ForeColor="red"
            Display="Dynamic" ControlToValidate="Description">
        </asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="LabelPath" runat="server" Text="Product image path:" Font-Bold="True"></asp:Label>
        <br />
        <asp:TextBox ID="Path" runat="server"></asp:TextBox>

        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Create product" OnClick="Button1_Click" />
        <br />
        <br />
    </div>
    <div runat="server" id="SuccessBlock" visible="False">
        <h2>product <b>
            <asp:Literal ID="LiteralName" runat="server"></asp:Literal></b> id: <b>
                <asp:Literal ID="LiteralID" runat="server"></asp:Literal></b> was created in catalog<a href="~/ProductList" runat="server"></a></h2>
    </div>
    <br />

    <div id="myform">
        <b>Name:</b>
        <br />
        <input name="myname" type="text" size="40">
        <br />
        <br />

        <textarea name="comment" cols="40" rows="3"></textarea><br />
        <br />

        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
        <br />
        <button>Button</button>
    </div>






</asp:Content>
