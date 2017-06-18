<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="BookStoreCatalog.WebUserControl1" %>
<asp:Panel ID="Panel1" runat="server"  BorderWidth="3px" Width="215px">
    <asp:Label ID="Label1" runat="server" Text="Книга №:"></asp:Label>
    <asp:Label ID="lblBookID" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Заглавие:"></asp:Label>
    <asp:Label ID="lblBookTitle" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Цена:"></asp:Label>
    <asp:Label ID="lblBookPrice" runat="server"></asp:Label>
    <br />
    <asp:CheckBox ID="CheckBox1" runat="server" Text="Отбележи за премахване" />
</asp:Panel>
