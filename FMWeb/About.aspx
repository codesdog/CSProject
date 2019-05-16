<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FMWeb.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <style>
        .mnuTopMenu {
            background-color: #ecf6ff;
            border: solid 1px #d6e8ff;
            font-family: 宋体;
            font-size: 20px;
            color: #1E5494;
        }

        .DynamicMenuStyle /*动态菜单矩形区域样式*/ {
            background-color: #ecf6ff;
            border: solid 1px #d6e8ff;
            padding: 1px 1px 1px 1px;
            text-align: left;
            font-family: 宋体;
            font-size: 14px;
        }

        .DynamicHoverStyle /*动态菜单项:鼠标悬停时的样式*/ {
            background-color: #ecf6ff; /*#7C6F57;*/
            color: #333333;
        }

        .DynamicSelectedStyle /*动态菜单项:选择时的样式*/ {
            background-color: Red;
            color: red;
        }

        .DynamicMenuItemStyle /*动态菜单项样式*/ {
            padding: 2px 5px 2px 5px;
            color: #000000;
            background-color: #ecf6ff;
            font-family: 宋体;
            font-size: 14px;
        }


        .StaticSelectedStyle /*静态菜单项:选择时的样式*/ {
            /*background-color:Gainsboro;*/
            color: red;
        }

        .StaticMenuItemStyle /*静态菜单项样式*/ {
            cursor: pointer;
            padding: 2px 5px 2px 5px;
            color: #1E5494;
            background-color: Transparent;
        }

        .StaticHoverStyle /*静态菜单项:鼠标悬停时的样式*/ {
            background-color: #FFCC66; /*#7C6F57;*/
            cursor: pointer;
            color: #1E5494;
        }
    </style>
       
    <div>
            <asp:Menu ID="menu01" runat="server" Orientation="Horizontal" DynamicHorizontalOffset="2" StaticDisplayLevels="1"  CssClass="mnuTopMenu" Width="801px" StaticSubMenuIndent="10px" DisappearAfter="600" StaticSelectedStyle-CssClass="StaticSelectedStyle" StaticMenuItemStyle-CssClass="StaticMenuItemStyle" StaticHoverStyle-CssClass="StaticHoverStyle" DynamicMenuStyle-CssClass="DynamicMenuStyle" DynamicSelectedStyle-CssClass="DynamicSelectedStyle" DynamicMenuItemStyle-CssClass="DynamicMenuItemStyle" DynamicHoverStyle-CssClass="DynamicHoverStyle">
                <Items>
                    <asp:MenuItem Text="首页" Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="关于" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="导航" Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="联系" Value="3"></asp:MenuItem>
                </Items>
            </asp:Menu>
    </div>
    <asp:MultiView ID="mv1" runat="server">
        <asp:View ID="View0" runat="server">
            <asp:Button ID="btnSubmit" runat="server" Text="关灯" />
            <asp:Label ID="lbErr" runat="server" Text="现在是开灯状态"></asp:Label>
        </asp:View>
        <asp:View ID="View1" runat="server">这是第 2 页</asp:View>
        <asp:View ID="View2" runat="server">这是第 3 页</asp:View>
        <asp:View ID="View3" runat="server">这是第 4 页</asp:View>
    </asp:MultiView>
</asp:Content>
