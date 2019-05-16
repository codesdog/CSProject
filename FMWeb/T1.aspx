<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="T1.aspx.cs" Inherits="FMWeb.T1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
            border-right:1px solid #808080;
        }

        .DynamicHoverStyle /*动态菜单项:鼠标悬停时的样式*/ {
            background-color: #ecf6ff; /*#7C6F57;*/
            color: #333333;
        }

        .DynamicSelectedStyle /*动态菜单项:选择时的样式*/ {
            background-color: #FFCC66;
            color: red;
        }

        .DynamicMenuItemStyle /*动态菜单项样式*/ {
            padding: 2px 5px 2px 5px;
            color: #000000;
            background-color: #ecf6ff;
            font-family: 宋体;
            font-size: 14px;
            border-right:1px solid #808080;
        }


        .StaticSelectedStyle /*静态菜单项:选择时的样式*/ {
            background-color:Gainsboro;
            color: red;
            font-weight:bold;
        }

        .StaticMenuItemStyle /*静态菜单项样式*/ {
            cursor: pointer;
            padding: 2px 5px 2px 5px;
            color: #1E5494;
            background-color: Transparent;
            border-right:1px solid #808080;
        }

        .StaticHoverStyle /*静态菜单项:鼠标悬停时的样式*/ {
            background-color: #FFCC66; /*#7C6F57;*/
            cursor: pointer;
            color: #1E5494;
        }
    </style>

    <asp:Menu ID="Menu1" runat="server" StaticDisplayLevels="1" CssClass="mnuTopMenu"
        OnMenuItemClick="Menu1_MenuItemClick"
        DynamicHorizontalOffset="-1" Orientation="Horizontal"
        StaticSubMenuIndent="10px" DisappearAfter="600">
        <StaticSelectedStyle CssClass="StaticSelectedStyle" Font-Bold="true" />
                            <StaticMenuItemStyle CssClass="StaticMenuItemStyle" BorderStyle="Outset" BorderWidth="1px" BorderColor="#D9D9E6" />
                            <StaticHoverStyle CssClass="StaticHoverStyle" BorderStyle="Solid" BorderWidth="1px" BorderColor="#D9D9FF" />
                            <DynamicMenuStyle CssClass="DynamicMenuStyle" BorderStyle="Outset" BorderWidth="1px" BorderColor="#D9D9E6" />
                            <DynamicSelectedStyle CssClass="DynamicSelectedStyle" />
                            <DynamicMenuItemStyle CssClass="DynamicMenuItemStyle"/>
                            <DynamicHoverStyle CssClass="DynamicHoverStyle" BorderStyle="Solid" BorderWidth="1px" BorderColor="#D9D9FF" />
        <Items>
            <asp:MenuItem Text="任务表单" Value="任务表单">
                <asp:MenuItem Text="查看全部" Value="查看全部"></asp:MenuItem>
                <asp:MenuItem Text="按承办部门" Value="按承办部门">
                    <asp:MenuItem Text="装备计划科" Value="装备计划科"></asp:MenuItem>
                    <asp:MenuItem Text="资产管理科" Value="资产管理科"></asp:MenuItem>
                    <asp:MenuItem Text="资产经营科" Value="资产经营科"></asp:MenuItem>
                    <asp:MenuItem Text="设备管理科" Value="设备管理科"></asp:MenuItem>
                    <asp:MenuItem Text="装备制造科" Value="装备制造科"></asp:MenuItem>
                    <asp:MenuItem Text="技术管理科" Value="技术管理科"></asp:MenuItem>
                    <asp:MenuItem Text="境外资产科" Value="境外资产科"></asp:MenuItem>
                    <asp:MenuItem Text="综合管理科" Value="综合管理科"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="按任务来源" Value="按任务来源">
                    <asp:MenuItem Text="工作计划" Value="工作计划"></asp:MenuItem>
                    <asp:MenuItem Text="批办文件" Value="批办文件"></asp:MenuItem>
                    <asp:MenuItem Text="部室例会" Value="部室例会"></asp:MenuItem>
                    <asp:MenuItem Text="领导交办" Value="领导交办"></asp:MenuItem>
                </asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="工作计划" Value="工作计划"></asp:MenuItem>
            <asp:MenuItem Text="批办文件" Value="批办文件"></asp:MenuItem>
        </Items>

    </asp:Menu>

    <asp:Menu ID="menu2" runat="server" Orientation="Horizontal" DynamicHorizontalOffset="0" DynamicVerticalOffset="5" Height="25" StaticEnableDefaultPopOutImage="false" Font-Size="16px" StaticItemFormatString="&amp;nbsp {0} &amp;nbsp" DynamicItemFormatString="&amp;nbsp {0} &amp;nbsp">
        <StaticMenuStyle BorderStyle="None" BackColor="#6f9dd9" BorderColor="#D9D9E6" />
        <StaticMenuItemStyle ForeColor="Black" BorderColor="#D9D9E6" BorderStyle="Solid"
            BorderWidth="1px" Font-Size="9pt" />
        <DynamicMenuStyle BorderStyle="Outset" BorderWidth="1px" BorderColor="#D9D9E6" BackColor="#6f9dd9" />
        <DynamicMenuItemStyle Font-Names="Tahoma" Font-Size="8pt" BorderStyle="Solid" BorderWidth="1px"
            BorderColor="#D9D9E6" />
        <StaticHoverStyle BackColor="Ivory" BorderStyle="Solid" BorderWidth="1px" BorderColor="#D9D9FF" />
        <DynamicHoverStyle BackColor="Ivory" BorderStyle="Solid" BorderWidth="1px" BorderColor="#D9D9FF" />
        <Items>
            <asp:MenuItem Text="AAAA" Selectable="false">
                <asp:MenuItem Text="aaaa" NavigateUrl="~/About.aspx"></asp:MenuItem>
                <asp:MenuItem Text="bbbb" NavigateUrl="~/Contract.aspx"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="BBBB" Selectable="false">
                <asp:MenuItem Text="aaaa" NavigateUrl="~/T1.aspx"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="CCCC" Selectable="false"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <style>
        .it-ec-dialog
{
}

.it-ec-textdiv
{
    position: absolute;
    top: 30px;
    left: 5px;
    right: 230px;
}

.it-ec-statsdiv
{
    position: absolute;
    top: 30px;
    right: 5px;
    width: 220px;
    height: 220px;
    background-color: pink;
}

.it-ec-paragraph
{
    text-align: justify;
    border: 1px solid;
    margin: 0px;
    padding: 5px;
    border-color: #663;
    background-color: #dcdcdc;
}

.it-ec-document
{
    position: absolute;
    top: 5px;
    height: 20px;
    left: 5px;
    right: 5px;
}

.it-ec-extract
{
    position: absolute;
    height: 100%;
}

    </style>
    <div class="it-ec-statsdiv">
        <dl class="it-chart-dl">
            <dt class="it-chart-dt">C2</dt>
            <dd class="it-chart-dd">
                <div class="it-chart-bar" style="background-color: red; width: 0.715603%;"></div>
                <div class="it-chart-label">1</div>
            </dd>
            <dt class="it-chart-dt">C1</dt>
            <dd class="it-chart-dd">
                <div class="it-chart-bar" style="background-color: orange; width: 1.43121%;"></div>
                <div class="it-chart-label">2</div>
            </dd>
            <dt class="it-chart-dt">B2</dt>
            <dd class="it-chart-dd">
                <div class="it-chart-bar" style="background-color: yellow; width: 3.57801%;"></div>
                <div class="it-chart-label">5</div>
            </dd>
            <dt class="it-chart-dt">B1</dt>
            <dd class="it-chart-dd">
                <div class="it-chart-bar" style="background-color: green; width: 12.1652%;"></div>
                <div class="it-chart-label">17</div>
            </dd>
            <dt class="it-chart-dt">A2</dt>
            <dd class="it-chart-dd">
                <div class="it-chart-bar" style="background-color: blue; width: 7.87163%;"></div>
                <div class="it-chart-label">11</div>
            </dd>
            <dt class="it-chart-dt">A1</dt>
            <dd class="it-chart-dd">
                <div class="it-chart-bar" style="background-color: indigo; width: 55.1014%;"></div>
                <div class="it-chart-label">77</div>
            </dd>
            <dt class="it-chart-dt">UN</dt>
            <dd class="it-chart-dd">
                <div class="it-chart-bar" style="background-color: grey; width: 20.0369%;"></div>
                <div class="it-chart-label">28</div>
            </dd>
        </dl>
    </div>
    <asp:Label ID="lbErr" runat="server" Text=""></asp:Label>
</asp:Content>
