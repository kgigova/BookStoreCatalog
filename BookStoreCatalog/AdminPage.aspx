<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreCatalog.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="BookStoreCatalog.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Categories" runat="server">
    <asp:Button ID="wtf" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset class="searchform" id="RegistrationForm" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" AutoGenerateRows="False" CssClass="space" OnItemUpdating="DetailsView1_ItemUpdating">
        <CommandRowStyle Font-Size="15pt" Font-Bold="true"/>
        <Fields>
            <asp:TemplateField HeaderText="Заглавие" SortExpression="title">
                <HeaderTemplate>
                     <asp:Label ID="lbTitle" runat="server" CssClass="searchforminput" Style="font-size:18pt;font-weight:bold;">Заглавие</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbTitleValue" runat="server" CssClass="searchforminput" Style="font-size:18pt;" Text='<%# Bind("title") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="searchforminput" Width="300px" Height="15px" Text='<%# Bind("title") %>'></asp:TextBox>
                </EditItemTemplate>
             </asp:TemplateField>

            <asp:TemplateField HeaderText="Автор" SortExpression="title">
                <HeaderTemplate>
                     <asp:Label ID="lbAuthor" runat="server" CssClass="searchforminput" Style="font-size:18pt;font-weight:bold;">Автор</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbAuthorValue" runat="server" CssClass="searchforminput" Style="font-size:18pt;" Text='<%# Bind("author_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtAuthor" runat="server" CssClass="searchforminput" Width="300px" Height="15px" Text='<%# Bind("author_name") %>'></asp:TextBox>
                </EditItemTemplate>
             </asp:TemplateField>

            <asp:TemplateField HeaderText="Автор" SortExpression="title">
                <HeaderTemplate>
                     <asp:Label ID="lbDescription" runat="server" CssClass="searchforminput" Style="font-size:18pt;font-weight:bold;">Описание</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbDescriptionValue" runat="server" CssClass="searchforminput" Style="font-size:18pt;" Text='<%# Bind("description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="searchforminput" Width="300px" TextMode="MultiLine" Height="100px" Text='<%# Bind("description") %>'></asp:TextBox>
                </EditItemTemplate>
             </asp:TemplateField>

            <asp:TemplateField HeaderText="Цена" SortExpression="b_prize">
                <HeaderTemplate>
                     <asp:Label ID="lbPrize" runat="server" CssClass="searchforminput" Style="font-size:18pt;font-weight:bold;">Цена</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbPrizeValue" runat="server" CssClass="searchforminput" Style="font-size:18pt;" Text='<%# Bind("b_prize") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPrize" runat="server" CssClass="searchforminput" Width="300px" Height="15px" Text='<%# Bind("b_prize") %>'></asp:TextBox>
                </EditItemTemplate>
             </asp:TemplateField>

            <asp:TemplateField HeaderText="Категория" SortExpression="c_fname">
                <HeaderTemplate>
                     <asp:Label ID="lbCategory" runat="server" CssClass="searchforminput" Style="font-size:18pt;font-weight:bold;">Категория</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbCategoryValue" runat="server" Text='<%# Bind("c_fname") %>' CssClass="searchforminput" Style="font-size:18pt;"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList 
                        ID="CategoryName" 
                        CssClass="searchforminput"
                        runat="server" 
                        DataSourceID="SqlDataSource2"
                        DataTextField="c_fname"
                        DataValueField="c_fname"
                         Width="300px"
                        SelectedValue='<%# Bind("c_fname") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" SelectCommand="SELECT [c_fname] FROM [category]"></asp:SqlDataSource>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                     <asp:Label ID="lbThumbnail" runat="server" CssClass="searchforminput" Style="font-size:18pt;font-weight:bold;">Картинка</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Image Width="96px" Height="128px" runat="server" ID="imgBookPic" ImageUrl='<%# Bind("imagePath") %>'/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <p>
                        <asp:Label ID="lblMessageText" runat="server" style="color:red"></asp:Label>
                    </p>
                     <asp:Label ID="lblImagePath" runat="server" style="color:red" Text='<%# Bind("imagePath") %>'></asp:Label>
                    <asp:Image runat="server" id="imgBookImage" style="display:none" With="64" Height="128"/>
                </EditItemTemplate>
            </asp:TemplateField>
             <asp:CommandField 
                 ShowDeleteButton="True"
                 ShowEditButton="True" 
                 ShowInsertButton="True" 
                 DeleteText="Изтриване" 
                 EditText="Промяна" 
                 NewText="Нова книга" 
                 UpdateText="Запазване" 
                 CancelText="Отказ"
                 InsertText="Добавяне"/>
        </Fields>
        <HeaderStyle CssClass="searchforminput" />
    </asp:DetailsView>
    </fieldset>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreCatalog_1621448ConnectionString %>" DeleteCommand="sp_delete_book" InsertCommand="sp_insert_bookdetails" SelectCommand="sp_select_book" UpdateCommand="sp_update_bookdetails" InsertCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" UpdateCommandType="StoredProcedure" OnUpdating="SqlDataSource1_Updating1">
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
</asp:Content>
