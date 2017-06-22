<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="BookStoreCatalog.Catalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" DataSourceID="SqlDataSource1" style="width:100%">
        <ItemStyle Width="30%" />
        <ItemTemplate>
            <div>
                <asp:Image ID="imgBookPic" ImageUrl='<%# Bind("imagePath") %>' runat="server" style="width:60%; height:90%; margin:auto"/>
                <div style="margin:5px">
                    <asp:LinkButton runat="server" ID="linkShowDetails" href='<%# string.Format("Details.aspx?book_id={0}", Eval("book_id")) %>' Text='<%# Bind("title") %>' style="font-weight:bold"></asp:LinkButton>
                </div>
                <div style="margin:5px">
                    <asp:Label ID="lblAuthor" runat="server" Text='<%# Bind("author_name") %>' ></asp:Label>
                </div>
                <div style="margin:5px">
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_name") %>' style="color:#507DDC; font-weight:bold"></asp:Label>
                </div>
                <asp:Label ID="lblBookPrice" runat="server" Text='<%# string.Format("{0} лв.", Eval("b_price")) %>' style="font-size:12pt;color:#D6593D;margin:5px"></asp:Label>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" SelectCommand="if @c_name = '-1'
(select * from BookDetails);
else
(SELECT * FROM [BookDetails] WHERE ([c_name] = @c_name));">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="-1" Name="c_name" QueryStringField="Category" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
