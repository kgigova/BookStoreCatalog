<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BookStoreCatalog.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="Categories" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Създай своя профил</h3>
    <fieldset class="searchform" id="RegistrationForm" runat="server">
        <table class="space">
            <tr>
                <td>
                    <asp:Label ID="lbFirstName" runat="server" Text="Име" Font-Size="18pt" Font-Bold="True" CssClass="searchforminput"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="210px" CssClass="searchforminput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbLastName" runat="server" Text="Фамилия" Font-Size="18pt" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server" Width="210px" CssClass="searchforminput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbEmail" runat="server" Text="Имейл" Font-Size="18pt" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="210px" CssClass="searchforminput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbUserName" runat="server" Text="Потребителско име" Font-Size="18pt" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" Width="210px" CssClass="searchforminput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbPassword" runat="server" Text="Парола" Font-Size="18pt" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" Width="210px" TextMode="password" CssClass="searchforminput"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnReg" runat="server" CssClass="formbutton" Text="Регистрация" Width="230px" Font-Bold="True" OnClick="btnReg_Click" />
                </td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" Text="Отказ" CssClass="formbutton formButtonReverse" Width="230px" Font-Bold="True" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="searchform">
        <p>
            <asp:Label ID="lbMessage" runat="server" Font-Size="18pt"></asp:Label>
        </p>
    </fieldset>
</asp:Content>


