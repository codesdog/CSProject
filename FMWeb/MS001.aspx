<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MS001.aspx.cs" Inherits="FMWeb.MS001" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--图标和默认样式-->
		<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">

		<!--核心样式-->
		<link href="css/ySelect.css" rel="stylesheet" type="text/css">

		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/ySelect.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.demo0').ySelect({
                placeholder: '请先选择Topic',
                searchText: '搜索',
                showSearch: true,
                numDisplayed: 4,
                overflowText: '已选中 {n}项',
                isCheck: false
            });

            $("#current0").click(function () {
                alert($("#m0").ySelectedValues(","));
                alert($("#m0").ySelectedTexts(","));
            });

            $('.demo1').ySelect({
                placeholder: '请先选择Genner',
                searchText: '搜索',
                showSearch: true,
                numDisplayed: 4,
                overflowText: '已选中 {n}项',
                isCheck: false
            });
        });
        function getselect(val) {
            var myitem = val.getAttribute("data-item");
            var myid = "#" + myitem;
            alert($(myid).ySelectedValues(","));
            alert($(myid).ySelectedTexts(","));
        }
		</script>
    <br />
    <input type="button" value="查看" class="btn btn-primary btn-sm" onclick="getselect(this)" data-item="m0"/>
    <br />
    <button id="current0" class="btn btn-primary btn-sm">查看选中Topic</button>
    <div class="container" id="divC" runat="server">       
			<select id='m0' class="demo0" multiple="multiple" >
				
			</select>
       
        <select id='m1' class="demo1" multiple="multiple" >
				
			</select>
    </div>
    <button id="current1" class="btn btn-primary btn-sm">查看选中Genner</button>
    <br />
    <asp:Button ID="btnSub" runat="server" Text="查看值" CssClass="btn btn-primary btn-sm"/>
    <textarea id="txt" runat="server" cols="50" rows="30"></textarea>
    <asp:Label ID="lbErr" runat="server" Text="" ForeColor="Red"></asp:Label>
</asp:Content>
