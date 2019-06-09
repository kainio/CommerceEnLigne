<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gestion_produits.aspx.cs" Inherits="CommerceEnligne.gestion_produits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <label>
    Nom du produit:
    </label>
    <asp:TextBox ID="N_Produit" runat="server"></asp:TextBox><br />
        <label>
    Prix:
    </label>
    <asp:TextBox ID="Prix" runat="server"></asp:TextBox><br />
            <label>
    StockActuel:
    </label>
    <asp:TextBox ID="StockA" runat="server"></asp:TextBox><br />
            <label>
    StockMinimum:
    </label>
    <asp:TextBox ID="StockM" runat="server"></asp:TextBox><br />
            <label>
    Photo:
    </label>
    <asp:TextBox ID="Photo" runat="server"></asp:TextBox><br />
    <asp:Button type="submit"  runat="server" Text="Ajouter le produit" 
    onclick="Unnamed1_Click"/>
</asp:Content>
