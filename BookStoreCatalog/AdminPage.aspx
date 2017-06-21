<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="BookStoreCatalog.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset class="searchform" id="RegistrationForm" runat="server">
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" AutoGenerateRows="False" CssClass="space" OnItemUpdating="DetailsView1_ItemUpdating" OnDataBound="DetailsView1_DataBound" OnItemInserting="DetailsView1_ItemInserting">
            <CommandRowStyle Font-Size="15pt" Font-Bold="true" />
            <Fields>
                <asp:TemplateField HeaderText="&#1047;&#1072;&#1075;&#1083;&#1072;&#1074;&#1080;&#1077;" SortExpression="title">
                    <HeaderTemplate>
                        <asp:Label ID="lbTitle" runat="server" CssClass="searchforminput" Style="font-size: 18pt; font-weight: bold;">&#1047;&#1072;&#1075;&#1083;&#1072;&#1074;&#1080;&#1077;</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbTitleValue" runat="server" CssClass="searchforminput" Style="font-size: 18pt;" Text='<%# Bind("title") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="searchforminput" Width="300px" Height="15px" Text='<%# Bind("title") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="&#1040;&#1074;&#1090;&#1086;&#1088;" SortExpression="title">
                    <HeaderTemplate>
                        <asp:Label ID="lbAuthor" runat="server" CssClass="searchforminput" Style="font-size: 18pt; font-weight: bold;">&#1040;&#1074;&#1090;&#1086;&#1088;</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbAuthorValue" runat="server" CssClass="searchforminput" Style="font-size: 18pt;" Text='<%# Bind("author_name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAuthor" runat="server" CssClass="searchforminput" Width="300px" Height="15px" Text='<%# Bind("author_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="&#1040;&#1074;&#1090;&#1086;&#1088;" SortExpression="title">
                    <HeaderTemplate>
                        <asp:Label ID="lbDescription" runat="server" CssClass="searchforminput" Style="font-size: 18pt; font-weight: bold;">&#1054;&#1087;&#1080;&#1089;&#1072;&#1085;&#1080;&#1077;</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbDescriptionValue" runat="server" CssClass="searchforminput" Style="font-size: 18pt;" Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="searchforminput" Width="300px" TextMode="MultiLine" Height="100px" Text='<%# Bind("description") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="&#1062;&#1077;&#1085;&#1072;" SortExpression="b_prize">
                    <HeaderTemplate>
                        <asp:Label ID="lbPrize" runat="server" CssClass="searchforminput" Style="font-size: 18pt; font-weight: bold;">&#1062;&#1077;&#1085;&#1072;</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbPrizeValue" runat="server" CssClass="searchforminput" Style="font-size: 18pt;" Text='<%# string.Format("{0} лв.", Eval("b_prize")) %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPrize" runat="server" CssClass="searchforminput" Width="300px" Height="15px" Text='<%# Bind("b_prize") %>'></asp:TextBox><asp:Label ID="lbPrice" runat="server" Text="лв."></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="&#1050;&#1072;&#1090;&#1077;&#1075;&#1086;&#1088;&#1080;&#1103;" SortExpression="c_fname">
                    <HeaderTemplate>
                        <asp:Label ID="lbCategory" runat="server" CssClass="searchforminput" Style="font-size: 18pt; font-weight: bold;">&#1050;&#1072;&#1090;&#1077;&#1075;&#1086;&#1088;&#1080;&#1103;</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbCategoryValue" runat="server" Text='<%# Bind("c_fname") %>' CssClass="searchforminput" Style="font-size: 18pt;"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList
                            ID="CategoryName"
                            CssClass="searchforminput"
                            runat="server"
                            Width="300px">
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="lbThumbnail" runat="server" CssClass="searchforminput" Style="font-size: 18pt; font-weight: bold;">&#1050;&#1072;&#1088;&#1090;&#1080;&#1085;&#1082;&#1072;</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Image Width="96px" Height="128px" runat="server" ID="imgBookPic" ImageUrl='<%# Bind("imagePath") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <p>
                            <asp:Label ID="lblMessageText" runat="server" Style="color: red"></asp:Label>
                        </p>
                        <asp:Label ID="lblImagePath" runat="server" Style="color: red" Text='<%# Bind("imagePath") %>'></asp:Label>
                        <asp:Image runat="server" ID="imgBookImage" Style="display: none" With="64" Height="128" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField
                    ShowDeleteButton="True"
                    ShowEditButton="True"
                    ShowInsertButton="True"
                    DeleteText="&#1048;&#1079;&#1090;&#1088;&#1080;&#1074;&#1072;&#1085;&#1077;"
                    EditText="&#1055;&#1088;&#1086;&#1084;&#1103;&#1085;&#1072;"
                    NewText="&#1053;&#1086;&#1074;&#1072; &#1082;&#1085;&#1080;&#1075;&#1072;"
                    UpdateText="&#1047;&#1072;&#1087;&#1072;&#1079;&#1074;&#1072;&#1085;&#1077;"
                    CancelText="&#1054;&#1090;&#1082;&#1072;&#1079;"
                    InsertText="&#1044;&#1086;&#1073;&#1072;&#1074;&#1103;&#1085;&#1077;" />
            </Fields>
            <HeaderStyle CssClass="searchforminput" />
        </asp:DetailsView>
    </fieldset>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" DeleteCommand="sp_delete_book" InsertCommand="sp_insert_bookdetails" SelectCommand="sp_select_book" UpdateCommand="sp_update_bookdetails" InsertCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="book_id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="c_fname" Type="String" />
            <asp:Parameter Name="book_id" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="author_name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="b_prize" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="c_fname" Type="String" />
            <asp:Parameter Name="book_id" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="author_name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="b_prize" Type="Decimal" />
            <asp:Parameter Name="imagePath" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
</asp:Content>
