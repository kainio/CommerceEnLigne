<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Panier.aspx.cs" Inherits="CommerceEnligne.Panier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Panier</h1>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM Commander WHERE ([UserName] = @UserName) and (IDProduit = @IDProduit)" 
        SelectCommand="SELECT [Produit].[Nom]  As 'Nom_produit',[UserName], [Commander].[IDProduit], [Qte],  (Qte * Prix) as 'Sous-total' FROM [Commander]  INNER JOIN Produit ON [Commander].[IDProduit] = [Produit].[IDProduit] WHERE ([UserName] = @UserName)" 
        UpdateCommand="UPDATE Commander SET  [Qte] = @Qte   WHERE ([UserName] = @UserName) and (IDProduit = @IDProduit)">
        <DeleteParameters>
            <asp:Parameter Name="IDProduit" />
        </DeleteParameters>
        <SelectParameters>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Qte" />
            <asp:Parameter Name="IDProduit" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1"  runat="server" DataSourceID="SqlDataSource1" 
     ShowFooter="True" onrowupdating="GridView1_RowUpdating" 
        AutoGenerateColumns="False" ondatabound="GridView1_DataBound" 
        onrowdeleted="GridView1_RowDeleted" onrowupdated="GridView1_RowUpdated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        <asp:HiddenField ID="HF_ID_produit" runat="server" Value='<%# Bind("IDProduit") %>'></asp:HiddenField>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                        <asp:HiddenField ID="HF_ID_produit" runat="server" Value='<%# Bind("IDProduit") %>'></asp:HiddenField>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nom du produit" SortExpression="Nom_produit">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nom_produit") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nom_produit") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantité" SortExpression="Qte">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Qte") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Qte") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sous-total">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Sous-total") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Sous-total") %>'></asp:Label>
                </EditItemTemplate>
                 <FooterTemplate>
                            <asp:Label ID="Lbl_footer_total" runat="server"></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
           
        </Columns>
        
    </asp:GridView>
</asp:Content>
