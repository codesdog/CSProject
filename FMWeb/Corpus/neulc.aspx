﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="neulc.aspx.cs" Inherits="FMWeb.Corpus.neulc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="css/stylelc.css" media="screen" type="text/css" />
    <script type="text/javascript" src="js/neulc.js"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <style type="text/css">
        .flexbox_div {
            vertical-align: middle;
            margin:5px;
            text-align:left;
        }
        .flexbox_text{
            width:40px;
            height:20px;
            text-align:center;
        }
        .flexbox_asub{
            height:16px;
            width:16px;
            text-align: center;
            color:black;
            text-decoration:none;
            border:1px solid #808080;
            background-color:#f0f0f0;
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            vertical-align:central;
            padding-left:6px;
            padding-right:6px;
            padding-bottom:2px;
            font-weight:bold;
        }
        .flexbox_asub:visited {text-decoration:none;} 
        .flexbox_asub:hover{
            cursor:pointer;
            text-decoration:none;
            background-color:#808080;
            color:#ffffff;
        }
        flexbox_asub:active {color:#ba2636;} 
        .flexbox_a{
            height:16px;
            width:16px;
            text-align: center;
            color:black;
            text-decoration:none;
            border:1px solid #808080;
            background-color:#f0f0f0;
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            vertical-align:central;
            padding-left:5px;
            padding-right:5px;
            padding-bottom:2px;
            font-weight:bold;
        }
        .flexbox_a:visited {text-decoration:none;} 
        .flexbox_a:hover{
            cursor:pointer;
            text-decoration:none;
            background-color:#808080;
            color:#ffffff;
        }
         .flexbox_a:visited{
            text-decoration:none;
        }
        .qfld {
			border: none;
			line-height: 25px;
		}

		.qfld fieldset {
			border: 1px solid #808080;
			margin: 5px;
			line-height: 30px;
		}

		.qfld fieldset legend {
			text-align: left;
			font-weight: bold;
			font-size: 15px;
		}

		.cb td {
			width: 160px;
		}

		.cb label {
			height: 25px;
			width: 160px;
			display: inline-block;
			vertical-align: middle;
			margin-top: -4px;
		}

		.cb label:before {
			display: inline-block;
			background: #fff;
			vertical-align: middle;
			-webkit-transition: background ease-in .5s;
			-o-transition: background ease-in .5s;
			transition: background ease-in .5s;
		}

		.cb label:after {
			display: inline-block;
			background: rgb(54, 85, 5);
			vertical-align: middle;
			-webkit-transition: background ease-in .5s;
			-o-transition: background ease-in .5s;
			transition: background ease-in .5s;
		}
    </style>

     <script type="text/javascript">
         function add(txtId, diff, max) {
             var txt = document.getElementById(txtId);
             var a = parseInt(txt.value);
             a = a + diff;
             if (a > max) {
                 a = max;
             }
             txt.value = a;
         }

         function sub(txtId, diff, min) {
             var txt = document.getElementById(txtId);
             var a = parseInt(txt.value);
             a = a - diff;
             if (a < min) {
                 a = min;
             }
             txt.value = a;
         }
		</script>
    <script type="text/javascript">
    function checkAll() {
        for (var i = 0; i < document.getElementById("cblStatuteEnumTypeId").getElementsByTagName("input").length; i++) {
            document.getElementById("cblStatuteEnumTypeId_" + i).checked = true;
        }
    }

    function deleteAll() {
        for (var i = 0; i < document.getElementById("cblStatuteEnumTypeId").getElementsByTagName("input").length; i++) {
            document.getElementById("cblStatuteEnumTypeId_" + i).checked = false;
        }
    }

    function ReverseAll() {
        for (var i = 0; i < document.getElementById("cblStatuteEnumTypeId").getElementsByTagName("input").length; i++) {
            var objCheck = document.getElementById("cblStatuteEnumTypeId_" + i);
            if (objCheck.checked)
                objCheck.checked = false;
            else
                objCheck.checked = true;
        }
    }

    </script>
    <div class="divneulc">
        <%-- 快捷菜单 --%>
        <div id="divNav" class="divBlock">
            <ul class="imgul">
                <li>
                    <a><span style="font-size: 18px; font-weight: bold;">NEULC</span></a>
                </li>
                <li>
                    <a href="#">
                        <img alt="About NEULC" src="../images/Info.png" width="20" height="20" /></a>
                </li>
                <li>
                    <a href="#">
                        <img alt="Download" src="../images/Download.png" height="20" /></a>
                </li>
                <li>
                    <a href="admin.aspx">
                        <img alt="Upload" src="../images/Upload.png" height="20" /></a>
                </li>
                <li>
                    <a href="#">
                        <img alt="Share" src="../images/Share.png" height="20" /></a>
                </li>
                <li>
                    <a href="#">
                        <img alt="Guide" src="../images/Guide.png" height="20" /></a>
                </li>
            </ul>
        </div>
        <%-- 导航菜单 --%>
        <div id="divMenu" class="divBlock">
            <asp:Menu ID="muNeulc" runat="server" Orientation="Horizontal" DynamicHorizontalOffset="2" StaticDisplayLevels="1" CssClass="mnuTopMenu" Width="801px" StaticSubMenuIndent="10px" DisappearAfter="600">
                <Items>
                    <asp:MenuItem Text="Corpus" Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="Concordance" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="Collocate" Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="WordList" Value="3"></asp:MenuItem>
                    <asp:MenuItem Text="Cluster" Value="4"></asp:MenuItem>
                </Items>
                <StaticSelectedStyle Font-Bold="true" HorizontalPadding="10" VerticalPadding="4"  ForeColor="red" />
                <StaticMenuItemStyle HorizontalPadding="10" VerticalPadding="4" />
                <StaticHoverStyle ForeColor="red" />
                <DynamicMenuStyle HorizontalPadding="10" VerticalPadding="4" />
                <DynamicSelectedStyle BackColor="#808080" Font-Bold="true" ForeColor="red" />
                <DynamicMenuItemStyle BackColor="#ecf6ff" HorizontalPadding="18" VerticalPadding="4" />
                <DynamicHoverStyle ForeColor="red" />
            </asp:Menu>
        </div>
        <%-- 导航内容 --%>
        <div id="divViews" class="divBlock">
            <asp:MultiView ID="mvNeulc" runat="server">
              <%-- 检索 --%>
                <asp:View ID="vwQuery" runat="server">
                    <%-- 语料库检索div --%>
                    <div id="divforQueryCorpus" runat="server">
                        <div class="qfld" style="font-size: 14px;">
                            Select Corpus you need according to:
                        </div>
                        <div class="qfld">
                            <script type="text/javascript">
                                function checkOrNot(cblId, val) {
                                    for (var i = 0; i < document.getElementById(cblId).getElementsByTagName("input").length; i++) {
                                        document.getElementById(cblId + "_" + i).checked = val.checked;
                                    }
                                }
                            </script>
                            <fieldset id="fdsLevel">
                                <legend>Level
                                <input id="cbforLevel" type="checkbox" onchange='checkOrNot("<%=cblLevel.ClientID%>", this)' />
                                </legend>
                                <asp:CheckBoxList ID="cblLevel" runat="server" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow" CssClass="cb" RepeatColumns="6">
                                    <asp:ListItem Value="1">L1(freshmen)</asp:ListItem>
                                    <asp:ListItem Value="2">L2(sophomores)</asp:ListItem>
                                    <asp:ListItem Value="3">L3(juniors)</asp:ListItem>
                                    <asp:ListItem Value="4">L4(seniors)</asp:ListItem>
                                </asp:CheckBoxList>
                            </fieldset>
                            <fieldset>
                                <legend>Genre
                                <input id="cbforGenre" type="checkbox" onchange='checkOrNot("<%=cblGenre.ClientID%>", this)' />
                                </legend>
                                <asp:CheckBoxList ID="cblGenre" runat="server" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow" CssClass="cb" RepeatColumns="6">
                                    <asp:ListItem Value="1">Argumentation</asp:ListItem>
                                    <asp:ListItem Value="2">Narration</asp:ListItem>
                                    <asp:ListItem Value="3">Exposition</asp:ListItem>
                                    <asp:ListItem Value="4">Applied Writing</asp:ListItem>
                                </asp:CheckBoxList>
                            </fieldset>
                            <fieldset>
                                <legend>Topic
                               <input id="cbforTopic" type="checkbox" onchange='checkOrNot("<%=cblTopic.ClientID%>", this)' />
                                </legend>
                                <asp:CheckBoxList ID="cblTopic" runat="server" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow" RepeatColumns="6" CssClass="cb">
                                    <asp:ListItem Value="1">Culture</asp:ListItem>
                                    <asp:ListItem Value="2">Science & Technology</asp:ListItem>
                                    <asp:ListItem Value="3">Humanity</asp:ListItem>
                                    <asp:ListItem Value="4">Society</asp:ListItem>
                                </asp:CheckBoxList>
                            </fieldset>
                        </div>

                        <div class="qfld" id="divNEUAC">
                            <fieldset>
                                <legend>Year
                                    <input id="cbforYears" type="checkbox" onchange='checkOrNot("<%=cblYears.ClientID%>", this)' />
                                </legend>
                                <asp:CheckBoxList ID="cblYears" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="6" CssClass="cb">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                </asp:CheckBoxList>
                            </fieldset>
                            <fieldset>
                                <legend>Major
                                    <input id="cbforMajors" type="checkbox" onchange='checkOrNot("<%=cblMajors.ClientID%>", this)' />
                                </legend>
                                <asp:CheckBoxList ID="cblMajors" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="6" CssClass="cb">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                </asp:CheckBoxList>
                            </fieldset>
                            <fieldset id="fldJournals" runat="server">
                                <legend>Journal
                                    <input id="cbforJournals" type="checkbox" onchange='checkOrNot("<%=cblJournals.ClientID%>", this)' style="margin-left:99%"/><label for="cbforJournals" style="font-weight:normal">Select All Journal</label>
                                </legend>
                                <asp:CheckBoxList ID="cblJournals" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="6" CssClass="cb">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                </asp:CheckBoxList>
                            </fieldset>                            
                        </div>
                        <div class="qfld" style="text-align: center; margin: 10px;">
                            <asp:Button ID="btnSubmitforCorpus" runat="server" Text="Submit" CssClass="outbtndiv-button" />
                        </div>
                    </div>

                    <%-- 检索过后的语料库数据统计与分析 --%>
                    <div id="divforCorpusResult" runat="server" visible="false">
                        <div id="tab">
                            <h3 class="up" id="two1" onclick="setContentTab('two',1,3)">Summary by Level
                            </h3>
                            <div class="block" id="con_two_1">
                                <asp:Table ID="tbforLevel" runat="server"></asp:Table>
                            </div>
                            <h3 id="two2" onclick="setContentTab('two',2,3)">Summary by Topic</h3>
                            <div id="con_two_2">
                                <asp:Table ID="tbforTopic" runat="server"></asp:Table>
                            </div>
                            <h3 id="two3" onclick="setContentTab('two',3,3)">Summary by Genre</h3>
                            <div id="con_two_3">
                                <asp:Table ID="tbforGenre" runat="server"></asp:Table>
                            </div>
                            <asp:Button ID="btnBacktoQuery" runat="server" Text="Back to Query" OnClientClick="Uncheck_All()" Width="140px" class="outbtndiv-button"/>
                        </div>

                        <script type="text/javascript">
                            function setContentTab(name, curr, n) {
                                for (i = 1; i <= n; i++) {
                                    var menu = document.getElementById(name + i);
                                    var cont = document.getElementById("con_" + name + "_" + i);
                                    menu.className = i == curr ? "up" : "";
                                    if (i == curr) {
                                        cont.style.display = "block";
                                        cont.className = "block";
                                    } else {
                                        cont.style.display = "none";
                                    }
                                }
                            }
                        </script>
                    </div>
                </asp:View>

                <%-- Concordance --%>
                <asp:View ID="vwConcordance" runat="server">
                    <div id="divConcordanceQuery" runat="server" class="qfld">
                        <fieldset>
                            <legend>Select Corpus you need according to:</legend>
                            <div class="flexbox_div">
                                Search for&nbsp;
                            <input type="text" id="keyConcordance" size="55" placeholder="Type a query keyWord here"  style="width:300px;height:20px;" class="input-text"/>
                            </div>
                            
                            <div class="flexbox_div">
                                Search for matches&nbsp;
                            <select id="sentencePos">
                                <option>at the start of</option>
                                <option selected="true">anywhere in</option>
                                <option>at the end of</option>
                            </select>&nbsp;
                            a sentence
                            </div>
                            <div class="flexbox_div">
                                Display each match at&nbsp;
                            <select id="matchPos">
                                <option>start</option>
                                <option selected="true">middle</option>
                                <option>end</option>
                            </select>
                                &nbsp;of a context of&nbsp;
                            <a href="#" onclick='sub("<%=chars.ClientID%>",1,5)' class="flexbox_asub">-</a>
                                <input type="text" id="chars" name="contextsize" size="4" value="10" runat="server" class="flexbox_text" />
                                <a href="#" onclick='add("<%=chars.ClientID%>",1,50)' class="flexbox_a">+</a>&nbsp;
                            <asp:DropDownList ID="ddlCharacters" runat="server">
                                <asp:ListItem Enabled="False" Value="0">characters</asp:ListItem>
                                <asp:ListItem Selected="True" Value="1">words</asp:ListItem>
                                <asp:ListItem Enabled="False" Value="2">sentences</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="flexbox_div">
                                Display up to&nbsp;
                            <a href="#" onclick='sub("terminate",10,10)' class="flexbox_asub">-</a>
                                <input type="text" id="terminate" name="terminate" size="4" value="100" class="flexbox_text" />
                                <a href="#" onclick='add("terminate",10,100)' class="flexbox_a">+</a>
                                &nbsp;matches with&nbsp;
                            <a href="#" onclick='sub("rpp",5,10)' class="flexbox_asub">-</a>
                                <input type="text" id="rpp" size="4" value="20" title="Type a new value or click the - + buttons to change the value." class="flexbox_text" />
                                <a href="#" onclick='add("rpp",5,50)' class="flexbox_a">+</a>&nbsp;
                            per page
                            </div>
                            <div class="flexbox_div">
                                <input type="checkbox" id="count" />
                                <label for="count">Show total number of matches </label>
                            </div>
                            <div class="flexbox_div">
                                <input type="button" id="submitConc" value="Search" class="outbtndiv-button" />
                            </div>
                        </fieldset>
                    </div>
                    <div id="divConcordanceResult" runat="server">
                        <asp:GridView ID="gvConcordance" runat="server" AutoGenerateColumns="False" CellPadding="2" ForeColor="#333333" GridLines="None" DataKeyNames="CorpusID" Width="100%" AllowPaging="True" PageSize="10" PagerSettings-Mode="NumericFirstLast">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <div style="padding: 2px">
                                                <asp:Label ID="lbTitle" runat="server" Text='<%# Bind("Title")%>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Left">
                                        <ItemTemplate>
                                            <div style="padding: 2px">
                                                <asp:Label ID="lbText" runat="server" Text='<%# Bind("OriginalText")%>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Left">
                                        <ItemTemplate>
                                            <div style="padding: 2px">
                                                <asp:Label ID="lbText" runat="server" Text='<%# Bind("OriginalText")%>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                </asp:View>

                <%-- Collocate --%>
                <asp:View ID="vwCollocate" runat="server">
                    <div id="divCollocateQuery" runat="server" class="qfld">
                        <fieldset>
                            <legend>Select Corpus you need according to:</legend>
                            <div class="flexbox_div">
                                Search for collocates of&nbsp;
                            <input type="text" id="collocq" size="60" placeholder="Type a query KeyWord here" />
                            </div>
                            <div class="flexbox_div">
                                Display collocates found up to &nbsp;
                            <a href="#" onclick='sub("clField",1,0)' class="flexbox_asub">-</a>
                                <input type="text" id="clField" size="3" value="0" class="flexbox_text" />
                                <a href="#" onclick='add("clField",1,3)' class="flexbox_a">+</a>
                                &nbsp;word(s) to the left and&nbsp;
                            <a href="#" onclick='sub("crField",1,0)' class="flexbox_asub">-</a>
                                <input type="text" id="crField" size="3" value="1" class="flexbox_text" />
                                <a href="#" onclick='add("crField",1,3)' class="flexbox_a">+</a>
                                &nbsp;word(s) to the right&nbsp;
                            </div>
                            <div class="flexbox_div" style="display: none">
                                Collocate Part of Speech:&nbsp;
                            <input type="button" id="PosButton" class="shortbutton it-peb" value="PoS Editor" />
                            </div>
                            <div class="flexbox_div">
                                <input type="button" id="submitColloc" value="Search" class="shortbutton" />
                            </div>
                        </fieldset>
                    </div>
                    <div id="divCollocateResult" runat="server">

                    </div>
                </asp:View>


                <%-- WordList --%>
                <asp:View ID="vwWordList" runat="server">

                    <%-- 文本来源选择 --%>
                    <div id="divtxtFrom">
                        <asp:RadioButtonList ID="rbltxtFrom" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" AutoPostBack="true" CellPadding="10" CellSpacing="5" CssClass="cblList">
                            <asp:ListItem Value="0" Selected="true">Fill Text by Yourself </asp:ListItem>
                            <asp:ListItem Value="1" Enabled="false">Get Text From Corpus </asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:HiddenField ID="hdftxtFrom" Value="0" runat="server" />
                    </div>

                    <%-- 文本来源于个人输入 --%>
                    <div id="divfromshuru" class="wbdiv" runat="server">
                        <table class="wbtable">
                            <tr>
                                <th>Title：</th>
                                <td>
                                    <input type="text" value="" class="input-text" id="txt_Title" placeholder="Type the title" runat="server" />
                                </td>
                                <th>Author：
                                </th>
                                <td>
                                    <input type="text" value="" class="input-text" id="txt_Author" placeholder="Type the Author's Name" runat="server" />
                                </td>
                                <th>Topic：
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddlTopics" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <th>Text File：</th>
                                <td>
                                    <input type="file" onchange="upload(this)" />
                                </td>
                                <td colspan="4">你可以使用左边的文件控件从文本文件的导入内容，或者你可以在下方文本框中输入或者粘贴要处理的文本!
                                </td>
                            </tr>
                        </table>
                    </div>

                    <%-- 文本来源于语料库 --%>
                    <div id="divFromCorpus" runat="server" class="wbdiv">
                        <input type="text" class="input-text" value="" id="txtKeyWordsforWordlist" style="width: 300px; height: 25px; border: 1px solid #808080; border-radius: 5px 5px 5px 5px;" placeholder="Type the KeyWords" runat="server" title="Type the KeyWords" />
                        <asp:Button ID="btnQueryforWordlist" runat="server" Text=" 检 索 " CssClass="outbtndiv-button" />
                        <div id="divCorpusforWordList" runat="server" visible="false">
                            <hr />
                            <script type="text/javascript">
                                function fillTextfromRow(txt) {
                                    var txtCtrl = document.getElementById('<%=txtcontent.ClientID%>');
                                    txtCtrl.value = txt;
                                }
                            </script>
                            点击下面数据行，可以处理该行语料文本，点击后面的处理所有按钮，将处理筛选出的所有语料&nbsp;&nbsp;
                                                <asp:Button ID="btnLemmaAll" runat="server" Text="处理所有" />
                            <br />
                            <asp:GridView ID="gvCorpusforWordList" runat="server" AutoGenerateColumns="False" CellPadding="2" ForeColor="#333333" GridLines="None" DataKeyNames="CorpusID" Width="100%" AllowPaging="True" PageSize="10" PagerSettings-Mode="NumericFirstLast">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <div style="padding: 2px">
                                                <asp:Label ID="lbTitle" runat="server" Text='<%# Bind("Title")%>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Text">
                                        <ItemTemplate>
                                            <div style="padding: 2px">
                                                <asp:Label ID="lbText" runat="server" Text='<%# Bind("OriginalText")%>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                    </div>

                    <%-- 文本框与词汇表选择，及Lemma按钮 --%>
                    <div id="divTexts" class="wbdiv" runat="server" visible="false">
                        <div>
                            <textarea cols="100" id="txtcontent" v-model="body" onkeyup="wordStatic(this);" onchange="wordStatic(this);" onblur="wordStatic(this);" runat="server" rows="100" class="ta" placeholder="Type the English text you want to process here !"></textarea>
                        </div>
                        <div id="txtInfo">
                            <span style="color: blue">Limit: 100,000 Words&nbsp;&nbsp;</span>
                            <span id="mywords" style="display: none;">(<span id="wcount" style="color: red">Entered：0 Words;</span>
                                <span id="lcount" style="color: green">Remaining: 30,000 Words</span>)
                            </span>
                        </div>

                        <div id="divLemma">
                            <table>
                                <tr>
                                    <th>Select WordList：
                                    </th>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="rbVBS" runat="server" RepeatDirection="Horizontal" CssClass="cblList">
                                            <asp:ListItem Value="0" Selected="true">CECR</asp:ListItem>
                                            <asp:ListItem Value="1" Enabled="false">GSL</asp:ListItem>
                                            <asp:ListItem Value="2" Enabled="false">AWL</asp:ListItem>
                                            <asp:ListItem Value="3" Enabled="false">EVP</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:Button ID="clearBtn" runat="server" Text="Clear" CssClass="outbtndiv-button" ToolTip="Clear the Texts" />
                                            <asp:Button ID="lemmanew" runat="server" Text="Submit" CssClass="outbtndiv-button" ToolTip="Submit to Process" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <%-- 输出处理结果 --%>
                    <div id="divOutput" runat="server" visible="false" class="wbdiv">

                        <div class="divmain">
                            <div class="it-ec-textdiv" id="divContext" runat="server">
                                <%-- 这是输出的彩色文本以及各个级别单词占比 --%>
                            </div>
                            <div class="it-ec-statsdiv" id="divstats">
                                <%-- 单词颜色标记说明与占比 --%>

                                <div class="outbtndiv">
                                    <input id="btnLight" type="button" value="HighLight" data-i="1" onclick="HighLightAll(this)" class="outbtndiv-button" />
                                    <asp:Button ID="btnBackLemma" runat="server" Text="Back" CssClass="outbtndiv-button" ToolTip="关闭页面" />
                                    <asp:Button ID="btnCloseLemma" runat="server" Text="Close" CssClass="outbtndiv-button" ToolTip="关闭页面" />
                                </div>
                                <dl class="it-chart-dl" id="dlChart" runat="server">
                                    <dt class="it-chart-dt" data-level="UN" onclick="HighLightthis(this)">忽略处理</dt>
                                    <dd class="it-chart-dd" data-level="UN" onclick="HighLightthis(this)">
                                        <div class="it-chart-bar" style="background-color: grey; width: 11.1588%;"></div>
                                        <div class="it-chart-label">26(11.16%)</div>
                                    </dd>
                                    <dt class="it-chart-dt" data-level="C1" onclick="HighLightthis(this)">未处理</dt>
                                    <dd class="it-chart-dd" data-level="C1" onclick="HighLightthis(this)">
                                        <div class="it-chart-bar" style="background-color: orange; width: 2.5751%;"></div>
                                        <div class="it-chart-label">6(2.58%)</div>
                                    </dd>
                                    <dt class="it-chart-dt" data-level="C2" onclick="HighLightthis(this)">超纲词汇</dt>
                                    <dd class="it-chart-dd" data-level="C2" onclick="HighLightthis(this)">
                                        <div class="it-chart-bar" style="background-color: red; width: 1.7167%;"></div>
                                        <div class="it-chart-label">4(1.72%)</div>
                                    </dd>
                                    <dt class="it-chart-dt" data-level="A1" onclick="HighLightthis(this)">高中大纲</dt>
                                    <dd class="it-chart-dd" data-level="A1" onclick="HighLightthis(this)">
                                        <div class="it-chart-bar" style="background-color: indigo; width: 99.8283%; max-width: unset"></div>
                                        <div class="it-chart-label">186(88.83%)</div>
                                    </dd>
                                    <dt class="it-chart-dt" data-level="A2" onclick="HighLightthis(this)">基本要求</dt>
                                    <dd class="it-chart-dd" data-level="A2" onclick="HighLightthis(this)">
                                        <div class="it-chart-bar" style="background-color: blue; width: 3.4335%;"></div>
                                        <div class="it-chart-label">8(3.43%)</div>
                                    </dd>
                                    <dt class="it-chart-dt" data-level="B1" onclick="HighLightthis(this)">较高要求</dt>
                                    <dd class="it-chart-dd" data-level="B1" onclick="HighLightthis(this)">
                                        <div class="it-chart-bar" style="background-color: green; width: 1.2876%;"></div>
                                        <div class="it-chart-label">3(1.29%)</div>
                                    </dd>
                                    <dt class="it-chart-dt" data-level="B2" onclick="HighLightthis(this)">更高要求</dt>
                                    <dd class="it-chart-dd" data-level="B2" onclick="HighLightthis(this)">
                                        <div class="it-chart-bar" style="background-color: yellow; width: 0%;"></div>
                                        <div class="it-chart-label">0(0.00%)</div>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="divbr"></div>
                    </div>
                </asp:View>

                <%-- Cluster --%>
                <asp:View ID="vwCluster" runat="server">
                    <h2>Cluster</h2>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
