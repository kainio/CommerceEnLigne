<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ajouter.aspx.cs" Inherits="CommerceEnligne.Ajouter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT [IDCategorie], [NomCategorie], [Description], [Photo] FROM [Categorie]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT [IDProduit], [Nom], [Prix], [Photo] FROM [Produit] WHERE ([IDCatégorie] = @IDCatégorie)">
        <SelectParameters>
            <asp:QueryStringParameter Name="IDCatégorie" QueryStringField="id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="IDCategorie" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField HeaderText="IDCategorie" InsertVisible="False" 
                SortExpression="IDCategorie">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("IDCategorie") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("IDCategorie") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NomCategorie" SortExpression="NomCategorie">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NomCategorie") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="NCategorie" runat="server" NavigateUrl='<%# Eval("IDCategorie", "~/ajouter.aspx?id={0}") %>'><asp:Label ID="Label2" runat="server" Text='<%# Bind("NomCategorie") %>'></asp:Label></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Photo" SortExpression="Photo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Photo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Photo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
            <asp:BoundField DataField="Prix" HeaderText="Prix" SortExpression="Prix" />
            <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" />
            <asp:TemplateField HeaderText="Actions" >
                <ItemTemplate>
                    <asp:HyperLink runat="server" Text="Ajouter au panier" NavigateURL='<%# Eval("IDProduit", "~/ajouter.aspx?id_p={0}") %>' ID="HL_Ajout_panier"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
