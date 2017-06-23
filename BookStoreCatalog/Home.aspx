<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BookStoreCatalog.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <center>
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="welcomeMessage"></asp:Label>
                    <h3><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h3>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
             </center>
</asp:Content>
