<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FMWeb.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>

    <style>
        /*Start    顶部菜单////////////////////////////////////////////////////////////************/


.mnuTopMenu
{
    background-color:Transparent;
    font-family: 宋体;
    font-size: 12px;
    position:relative;
    top:34px;
}

.DynamicMenuStyle /*动态菜单矩形区域样式*/
{
    background-color: white;
    border: solid 1px #ACC3DF;
    padding: 1px 1px 1px 1px;
    text-align: left;
}

.DynamicHoverStyle /*动态菜单项:鼠标悬停时的样式*/
{
    background-color: #F7DFA5; /*#7C6F57;*/
    color: #333333;
}

.DynamicSelectedStyle /*动态菜单项:选择时的样式*/
{
    /*background-color:Gainsboro;*/
    color: red;
}

.DynamicMenuItemStyle /*动态菜单项样式*/
{
    padding: 2px 5px 2px 5px;
    color: #333333;
}


.StaticSelectedStyle /*静态菜单项:选择时的样式*/
{
    /*background-color:Gainsboro;*/
    color: red;
}

.StaticMenuItemStyle /*静态菜单项样式*/
{
    cursor: pointer;
    padding: 2px 5px 2px 5px;
    color: #333333;
    background-color:Transparent;
}

.StaticHoverStyle /*静态菜单项:鼠标悬停时的样式*/
{
    background-color: #84BCCD; /*#7C6F57;*/
    cursor: pointer;
    color: #333333;
}

/*End    顶部菜单////////////////////////////////////////////////////////////************/
    </style>
    <asp:Menu ID="mnuTopMenu" runat="server" DynamicEnableDefaultPopOutImage="False"
                    DynamicHorizontalOffset="-1" Font-Bold="false" Orientation="Horizontal" StaticEnableDefaultPopOutImage="False"
                    StaticSubMenuIndent="10px" DisappearAfter="600" 
                    StaticSelectedStyle-CssClass="StaticSelectedStyle"
                    StaticMenuItemStyle-CssClass="StaticMenuItemStyle"
                    StaticHoverStyle-CssClass="StaticHoverStyle"
                    DynamicMenuStyle-CssClass="DynamicMenuStyle"
                    DynamicSelectedStyle-CssClass="DynamicSelectedStyle"
                    DynamicMenuItemStyle-CssClass="DynamicMenuItemStyle"
                    DynamicHoverStyle-CssClass="DynamicHoverStyle" >
                  <Items>
                      <asp:MenuItem Text="首页" Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="关于" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="导航" Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="联系" Value="3"></asp:MenuItem>
                  </Items>
                </asp:Menu>

</asp:Content>
