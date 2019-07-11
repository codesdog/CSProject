<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestP.aspx.cs" Inherits="FMWeb.TestP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="tb1" runat="server" Height="211px" TextMode="MultiLine" Width="1126px"></asp:TextBox>
    <br />
    <asp:Button ID="btnCluster" runat="server" Text="Cluster" OnClick="btnCluster_Click" />
    <span id="spErr"></span>
    <br />
    <asp:Label ID="lbT1" runat="server" Text=""></asp:Label>
    <asp:Label ID="lbT2" runat="server" Text=""></asp:Label>
    <asp:Label ID="lbT3" runat="server" Text=""></asp:Label>
    <br />
    <asp:GridView ID="gv1" runat="server">
    </asp:GridView>
</asp:Content>
