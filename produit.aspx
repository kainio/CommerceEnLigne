<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="produit.aspx.cs" Inherits="CommerceEnligne.produit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT [Nom], [IDCatégorie], [Prix], [Photo], [IDProduit] FROM [Produit]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="IDProduit" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                <asp:BoundField DataField="IDCatégorie" HeaderText="IDCatégorie" 
                    SortExpression="IDCatégorie" />
                <asp:BoundField DataField="Prix" HeaderText="Prix" SortExpression="Prix" />
                <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" />
                <asp:BoundField DataField="IDProduit" HeaderText="IDProduit" 
                    InsertVisible="False" ReadOnly="True" SortExpression="IDProduit" />
            </Columns>
        </asp:GridView>
</asp:Content>
