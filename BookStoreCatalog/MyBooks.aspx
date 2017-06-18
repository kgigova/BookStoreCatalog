﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="MyBooks.aspx.cs" Inherits="BookStoreCatalog.MyBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="Categories" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" DataSourceID="SqlDataSource1" style="width:100%">
        <ItemStyle Width="30%" />
        <ItemTemplate>
            <div>
                <asp:Image runat="server" ID="imgBookPic" ImageUrl='<%# Bind("imagePath") %>' style="width:90%; height:60%; margin:auto"/>
                <div style="margin:5px">
                    <asp:LinkButton runat="server" ID="linkShowDetails" href='<%# string.Format("Details.aspx?book_id={0}", Eval("book_id")) %>' Text='<%# Bind("title") %>' style="font-weight:bold"></asp:LinkButton>
                </div>
                <div style="margin:5px">
                    <asp:Label ID="lblAuthor" runat="server" Text='<%# Bind("author_name") %>' ></asp:Label>
                </div>
                <div style="margin:5px">
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("c_fname") %>' style="color:#507DDC; font-weight:bold"></asp:Label>
                </div>
                <div style="margin:5px">
                    <asp:Label ID="Label1" runat="server" Text='<%# string.Format("Закупена на {0}", Eval("orderdate")) %>' style="font-size:12pt"></asp:Label>
                </div>
                <%--<asp:Label ID="lblBookPrice" runat="server" Text='<%# string.Format("{0} лв.", Eval("b_prize")) %>' style="font-size:12pt;color:#D6593D;margin:5px"></asp:Label>--%>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" SelectCommand="sp_select_mybooks" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="userid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>