<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FMWeb.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
	html,
body {
	margin: 0;
	height: 100%;
}

.divLoadingBG {
	width: 100%;
	height: 100%;
	background-color: #000;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 2;
	opacity: 0.3;
	/*兼容IE8及以下版本浏览器*/
	filter: alpha(opacity=30);
}

.divLoading {
	width: 200px;
	height: 200px;
	margin: auto;
	position: absolute;
	z-index: 3;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;	
}
</style>
    <script>function shield() {
	var s = document.getElementById("<%=divLoadingBG.ClientID%>");
	s.style.display = "block";

    var l = document.getElementById("<%=divLoading.ClientID%>");
	l.style.display = "block";
}

function cancel_shield() {
    var s = document.getElementById("<%=divLoadingBG.ClientID%>");
	s.style.display = "none";

    var l = document.getElementById("<%=divLoading.ClientID%>");
	l.style.display = "none";
}</script>
    <a href="javascript:shield()">打开遮罩</a>
    <asp:Button ID="btnSubmit" runat="server" Text="提交" />
    <div id="divLoadingBG" runat="server" class="divLoadingBG" style="display:none;"></div>
    <div id="divLoading" runat="server" class="divLoading" style="display:none;">	
	   
	    <img src="images/l8.gif"  />
    </div>
    <asp:Label ID="lbErr" runat="server" Text=""></asp:Label>
</asp:Content>
