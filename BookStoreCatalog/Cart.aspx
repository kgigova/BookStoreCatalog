<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BookStoreCatalog.Cart" %>

<%@ Register Src="WebUserControl1.ascx" TagName="WebUserControl1" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="&#1042;&#1098;&#1074; &#1074;&#1072;&#1096;&#1072;&#1090;&#1072; &#1082;&#1086;&#1096;&#1085;&#1080;&#1094;&#1072; &#1080;&#1084;&#1072;:"></asp:Label>
    </asp:Panel>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" DataSourceID="SqlDataSource1">
        <ItemStyle Width="30%" />
        <ItemTemplate>
            <div>
                <asp:Image runat="server" ID="imgBookPic" ImageUrl='<%# Bind("imagePath") %>' style="width:90%; height:60%; margin:auto"/>
                <asp:Label ID="lblBookID" Text='<%# Bind("book_id") %>' style="display:none" runat="server"></asp:Label>
                <div style="margin:5px">
                    <asp:LinkButton runat="server" ID="linkShowDetails" href='<%# string.Format("Details.aspx?book_id={0}", Eval("book_id")) %>' Text='<%# Bind("title") %>' style="font-weight:bold"></asp:LinkButton>
                </div>
                <div style="margin:5px">
                    <asp:Label ID="lblAuthor" runat="server" Text='<%# Bind("author_name") %>' ></asp:Label>
                </div>
                <div style="margin:5px">
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_name") %>' style="color:#507DDC; font-weight:bold"></asp:Label>
                </div>
                <asp:Label ID="Label3" runat="server" Text='<%# string.Format("{0} лв.", Eval("b_price")) %>' style="font-size:12pt;color:#D6593D;margin:5px"></asp:Label>
                <div class="squaredFour">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Премахване" CssClass="squaredFour"/>
	                <label for="CheckBox1" ></label>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" SelectCommand="sp_select_orders_for_user" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="-1" Name="user_id" SessionField="userid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Label ID="Label2" runat="server" Text="&#1054;&#1073;&#1097;&#1086;:"></asp:Label>
    <asp:Label ID="lbSum" runat="server"></asp:Label>
    <fieldset class="searchform" id="addToCartContainer" runat="server">
        <p>
            <asp:Button ID="btnOrder" runat="server" CssClass="formbutton" Text="&#1055;&#1086;&#1088;&#1098;&#1095;&#1072;&#1081;" OnClick="btnOrder_Click" />
            <asp:Button ID="btnDelete" runat="server" CssClass="formbutton" Text="&#1048;&#1079;&#1090;&#1088;&#1080;&#1074;&#1072;&#1085;&#1077; &#1085;&#1072; &#1084;&#1072;&#1088;&#1082;&#1080;&#1088;&#1072;&#1085;&#1080;&#1090;&#1077; &#1082;&#1085;&#1080;&#1075;&#1080;" OnClick="btnDelete_Click" />
        </p>
    </fieldset>
</asp:Content>
