<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BookStoreCatalog.Registration"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 278px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <h3>&#1057;&#1098;&#1079;&#1076;&#1072;&#1081; &#1089;&#1074;&#1086;&#1103; &#1087;&#1088;&#1086;&#1092;&#1080;&#1083;</h3>
    <fieldset class="searchform" id="RegistrationForm" runat="server">
        <table class="space">
            <tr>
                <td>
                    <asp:Label ID="lbFirstName" runat="server" Text="&#1048;&#1084;&#1077;" Font-Size="18pt" Font-Bold="True" CssClass="searchforminput"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="searchforminput" Width="300px" Height="15px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbLastName" runat="server" Text="&#1060;&#1072;&#1084;&#1080;&#1083;&#1080;&#1103;" Font-Size="18pt" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server" CssClass="searchforminput" Width="300px" Height="15px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbEmail" runat="server" Text="&#1048;&#1084;&#1077;&#1081;&#1083;" Font-Size="18pt" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="searchforminput" Width="300px" Height="15px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbUserName" runat="server" Text="&#1055;&#1086;&#1090;&#1088;&#1077;&#1073;&#1080;&#1090;&#1077;&#1083;&#1089;&#1082;&#1086; &#1080;&#1084;&#1077;" Font-Size="18pt" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="searchforminput" Width="300px" Height="15px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbPassword" runat="server" Text="&#1055;&#1072;&#1088;&#1086;&#1083;&#1072;" Font-Size="18pt" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="password" CssClass="searchforminput" Width="300px" Height="15px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnReg" runat="server" Text="&#1056;&#1077;&#1075;&#1080;&#1089;&#1090;&#1088;&#1072;&#1094;&#1080;&#1103;" CssClass="formbutton" Style="width: 100%" OnClick="btnReg_Click" />
                </td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" Text="&#1054;&#1090;&#1082;&#1072;&#1079;" CssClass="formbutton" Style="width: 72%" OnClick="btnCancel_Click" />
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