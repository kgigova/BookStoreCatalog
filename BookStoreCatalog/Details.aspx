<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BookStoreCatalog.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="book_id">
        <ItemTemplate>
            <article class="expanded">
                <h2>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("title") %>' /></h2>
                <div class="article-info">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("author_name") %>' /></div>

                <asp:Image ID="imgBookPic" ImageUrl='<%# Bind("imagePath") %>' runat="server" Style="width: 30%; height: 50%; margin: auto" />


                <p>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("description") %>' />
                </p>

                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">&#1053;&#1072;&#1079;&#1072;&#1076;</asp:LinkButton>
                <fieldset class="searchform" id="addToCartContainer" runat="server">
                    <asp:Button ID="btnAdd" runat="server" CssClass="formbutton" Text="&#1044;&#1086;&#1073;&#1072;&#1074;&#1080; &#1074; &#1082;&#1086;&#1096;&#1085;&#1080;&#1094;&#1072;&#1090;&#1072;" OnClick="btnAdd_Click" />

                    <iframe id="pdfContainer" src='<%# string.Format("Resources/ViewerJS/#../{0}", Eval("pdfPath")) %>' width='800' height='480' allowfullscreen webkitallowfullscreen runat="server"></iframe>
                </fieldset>
            </article>
        </ItemTemplate>
    </asp:FormView>
    <article class="expanded">
        <fieldset class="searchform" runat="server">
            <p runat="server" id="AddCommentForm">
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="searchforminput"></asp:TextBox>
                <asp:Button ID="btnAddComment" runat="server" CssClass="formbuttonreversed" Text="&#1044;&#1086;&#1073;&#1072;&#1074;&#1080; &#1082;&#1086;&#1084;&#1077;&#1085;&#1090;&#1072;&#1088;" OnClick="btnAddComment_Click" />
            </p>
        </fieldset>
    </article>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" SelectCommand="sp_select_booksdetails" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="book_id" QueryStringField="book_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AllowPaging="True" ShowHeader="false" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <article class="expanded">
                        <h4>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("fname") %>' />&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Eval("lname") %>' /></h4>
                        <div class="article-info">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("c_date_time") %>' /></div>
                        <p>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("comment") %>' />
                        </p>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" SelectCommand="sp_select_comments" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="book_id" QueryStringField="book_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
