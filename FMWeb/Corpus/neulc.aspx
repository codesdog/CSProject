<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="neulc.aspx.cs" Inherits="FMWeb.Corpus.neulc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="../css/stylelc.css" media="screen" type="text/css" />
    <script type="text/javascript">
        function Check_Uncheck_All() {
            var cbl0 = document.getElementById("<%=cblGenre.ClientID%>");
           var input = cbl0.getElementsByTagName("input");
           for (var i = 0; i < input.length; i++) {
               input[i].checked = false;
           }
           var cbl1 = document.getElementById("<%=cblGrade.ClientID%>");
           var input = cbl1.getElementsByTagName("input");
           for (var i = 0; i < input.length; i++) {
               input[i].checked = false;
           }
           var cbl2 = document.getElementById("<%=cblTopic.ClientID%>");
            var input = cbl2.getElementsByTagName("input");
            for (var i = 0; i < input.length; i++) {
                input[i].checked = false;
            }
            //if (cb.checked) {
            //    for (var i = 0; i < input.length; i++) {
            //        input[i].checked = true;
            //    }
            //}
            //else {
            //    for (var i = 0; i < input.length; i++) {
            //        input[i].checked = false;
            //    }
            //}
        }

        function HighLightthis(val) {
            var setValue = val.getAttribute("data-grade");
            var obj = js("<%=divContext.ClientID%>");
            var oldClass = "";
            var newClass = "";
            for (i in obj) {
                oldClass = obj[i].className;
                var classArr = oldClass.trim().split(/\s+/);
                if (classArr.indexOf(setValue) > -1) {
                    if (classArr.indexOf("highlight") > -1) { //已经是加颜色,本次操作将去掉颜色
                        newClass = oldClass.replace("highlight", "");
                        obj[i].classList.remove("highlight");
                        document.getElementById("btnLight").setAttribute("data-i", "1");
                        document.getElementById("btnLight").setAttribute("value", "HighLight");
                    } else { //未颜色,本次操作将增加颜色
                        newClass = oldClass + "highlight";
                        obj[i].classList.add("highlight");
                        document.getElementById("btnLight").setAttribute("data-i", "0");
                        document.getElementById("btnLight").setAttribute("value", "Clear");
                    }
                }
            }
        }

        function js(id) {
            return document.getElementById(id).getElementsByTagName("span");
        }

        function HighLightAll(val) {
            var setValue = val.getAttribute("data-i");
            var obj = js("<%=divContext.ClientID%>");
            if (setValue == 1) {
                val.setAttribute("data-i", "0");
                val.setAttribute("value", "Clear");
                for (i in obj) {
                    obj[i].classList.add("highlight");
                }
            }
            else {
                val.setAttribute("data-i", "1");
                val.setAttribute("value", "HighLight");
                for (i in obj) {
                    obj[i].classList.remove("highlight");
                }
            }
        }

        function upload(input) {
            var txt = document.getElementById("<%=txtcontent.ClientID%>");
            //支持chrome IE10
            if (window.FileReader) {
                var file = input.files[0];
                filename = file.name.split(".")[0];
                var reader = new FileReader();
                reader.onload = function () {
                    console.log(this.result)
                    //alert(this.result);
                    txt.value = this.result;
                    wordStatic(txt);
                }
                reader.readAsText(file);
            }
            //支持IE 7 8 9 10
            else if (typeof window.ActiveXObject != 'undefined') {
                var xmlDoc;
                xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = false;
                xmlDoc.load(input.value);
                //alert(xmlDoc.xml);
                txt.value = xmlDoc.xml;
                wordStatic(txt);
            }
            //支持FF
            else if (document.implementation && document.implementation.createDocument) {
                var xmlDoc;
                xmlDoc = document.implementation.createDocument("", "", null);
                xmlDoc.async = false;
                xmlDoc.load(input.value);
                //alert(xmlDoc.xml);
                txt.value = xmlDoc.xml;
                wordStatic(txt);
            } else {
                //alert('error');
                txt.value = "文件导入失败，请确认你是导入的文本文件！";
            }
        }
        function wordStatic(input) {
            // 获取文本框对象
            var el = document.getElementById('wcount');
            var ll = document.getElementById('lcount');
            var mw = document.getElementById('mywords');
            if (el && input) {
                // 获取输入内容长度并更新到界面
                var value = input.value;
                // 替换中文字符为空格
                value = value.replace(/[\u4e00-\u9fa5]+/g, " ");
                // 将换行符，前后空格不计算为单词数
                value = value.replace(/\n|\r|^\s+|\s+$/gi, "");
                // 多个空格替换成一个空格
                value = value.replace(/\s+/gi, " ");
                // 更新计数
                var length = 0;
                var match = value.match(/\s/g);
                if (match) {
                    length = match.length + 1;
                } else if (value) {
                    length = 1;
                }
                mw.style.display = "";
                el.innerText = "Entered：" + length + " Words;";
                if (length <= 100000) {
                    ll.innerHTML = "Remaining: " + (100000 - length) + " Words;";
                } else {
                    ll.innerHTML = "exceeded: " + (length - 100000) + " Words;";
                }

            }
        }
    </script>
    <div class="divneulc">
        <table border="0" class="neulctable">
            <tr>
                <td>
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
                            <a href="#">
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
                </td>
                <td style="text-align: right;">
                    <ul class="imgul">
                        <li><a>Login</a></li>
                        <li><a>Contact</a></li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border-top: 1px #808080 solid; border-bottom: 1px #808080 solid;">
                    <div>
                        <asp:Menu ID="muNeulc" runat="server" Orientation="Horizontal" DynamicHorizontalOffset="2" StaticDisplayLevels="1" CssClass="mnuTopMenu" Width="801px" StaticSubMenuIndent="10px" DisappearAfter="600">
                            <Items>
                                <asp:MenuItem Text="Corpus" Value="0"></asp:MenuItem>
                                <asp:MenuItem Text="Concordance" Value="1"></asp:MenuItem>
                                <asp:MenuItem Text="Collocate" Value="2"></asp:MenuItem>
                                <asp:MenuItem Text="WordList" Value="3"></asp:MenuItem>
                                <asp:MenuItem Text="Cluster" Value="4"></asp:MenuItem>
                            </Items>
                            <StaticSelectedStyle Font-Bold="true" HorizontalPadding="18" VerticalPadding="4" BorderStyle="Solid" BorderWidth="1px" BorderColor="#808080" />
                            <StaticMenuItemStyle HorizontalPadding="18" VerticalPadding="4" />
                            <StaticHoverStyle ForeColor="red" />
                            <DynamicMenuStyle HorizontalPadding="18" VerticalPadding="4" />
                            <DynamicSelectedStyle BackColor="#808080" Font-Bold="true" />
                            <DynamicMenuItemStyle BackColor="#ecf6ff" HorizontalPadding="18" VerticalPadding="4" />
                            <DynamicHoverStyle ForeColor="red" />
                        </asp:Menu>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="padding: 10px;">
                        <asp:MultiView ID="mvNeulc" runat="server">
                            <%-- 检索 --%>
                            <asp:View ID="vwQuery" runat="server">
                                <table style="border: none; line-height: 25px;" border="0">
                                    <tr>
                                        <td colspan="2">Select files you need according to:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Grade:
                                        </td>
                                        <td>
                                            <asp:CheckBoxList ID="cblGrade" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="cblList">
                                                <asp:ListItem Value="1">F1</asp:ListItem>
                                                <asp:ListItem Value="2">S2</asp:ListItem>
                                                <asp:ListItem Value="3">J3</asp:ListItem>
                                                <asp:ListItem Value="4">S4</asp:ListItem>
                                            </asp:CheckBoxList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Genre:
                                        </td>
                                        <td>
                                            <asp:CheckBoxList ID="cblGenre" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="cblList">
                                                <asp:ListItem Value="1">Argumentation</asp:ListItem>
                                                <asp:ListItem Value="2">Narration</asp:ListItem>
                                                <asp:ListItem Value="3">Exposition</asp:ListItem>
                                                <asp:ListItem Value="4">Applied Writing</asp:ListItem>
                                            </asp:CheckBoxList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Topic:
                                        </td>
                                        <td>
                                            <asp:CheckBoxList ID="cblTopic" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="cblList">
                                                <asp:ListItem Value="1">Culture</asp:ListItem>
                                                <asp:ListItem Value="2">Science & Technology</asp:ListItem>
                                                <asp:ListItem Value="3">Humanity</asp:ListItem>
                                                <asp:ListItem Value="4">Society</asp:ListItem>
                                            </asp:CheckBoxList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center; padding-top: 10px;">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="outbtndiv-button" />&nbsp;&nbsp;
								<asp:Button ID="btnReset" runat="server" Text="Reset" OnClientClick="Check_Uncheck_All()" CssClass="outbtndiv-button" />
                                        </td>
                                    </tr>
                                </table>

                            </asp:View>

                            <%-- Concordance --%>
                            <asp:View ID="vwConcordance" runat="server">
                                <h2>Concordance</h2>
                            </asp:View>

                            <%-- Collocate --%>
                            <asp:View ID="vwCollocate" runat="server">
                                <h2>Collocate</h2>
                            </asp:View>

                            <%-- WordList --%>
                            <asp:View ID="vwWordList" runat="server">

                                <%-- 输入文档 --%>
                                <div id="inputDiv" runat="server">
                                    <div id="divtxtFrom">
                                        <asp:RadioButtonList ID="rbltxtFrom" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" AutoPostBack="true" CellPadding="10" CellSpacing="5" CssClass="cblList">
                                            <asp:ListItem Value="0">Get Text From Corpus </asp:ListItem>
                                            <asp:ListItem Value="1">Fill Text by Yourself </asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div id="divFromCorpus" runat="server" class="wbdiv">
                                        <input type="text" class="input-text" value="" id="txtKeyWordsforWordlist" style="width: 300px; height: 25px; border: 1px solid #808080; border-radius: 5px 5px 5px 5px;" placeholder="Type the KeyWords" runat="server" title="Type the KeyWords" />
                                        <asp:Button ID="btnQueryforWordlist" runat="server" Text=" 检 索 " CssClass="outbtndiv-button" />
                                    </div>
                                    <div class="wbdiv" id="divfromshuru" runat="server" visible="false">
                                        <table class="wbtable">
                                            <tr>
                                                <th>Title：</th>
                                                <td>
                                                    <input type="text" value="" class="input-text" style="width: 300px; height: 25px; border: 1px solid #808080; border-radius: 5px 5px 5px 5px;" id="homecity_name" placeholder="Type the title" runat="server" />
                                                </td>
                                                <th>YourName：</th>
                                                <td>
                                                    <input id="username" type="text" class="input-text" title="Type Your Name" placeholder="Type Your Name" runat="server" style="height: 25px; border: 1px solid #808080; border-radius: 5px 5px 5px 5px;" />
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>导入文本：
                                                </th>
                                                <td>
                                                    <input type="file" onchange="upload(this)" />
                                                </td>
                                                <th>选择词表：
                                                </th>
                                                <td>
                                                    <asp:RadioButtonList ID="rbVBS" runat="server" RepeatDirection="Horizontal" CssClass="cblList">
                                                        <asp:ListItem Value="0">NEU</asp:ListItem>
                                                        <asp:ListItem Value="1">GSL</asp:ListItem>
                                                        <asp:ListItem Value="2">AWL</asp:ListItem>
                                                        <asp:ListItem Value="3">EVP</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div id="divTexts" class="wbdiv" runat="server" visible="false">
                                        <textarea cols="100" id="txtcontent" v-model="body" onkeyup="wordStatic(this);" onchange="wordStatic(this);" onblur="wordStatic(this);" runat="server" rows="100" class="ta" placeholder="Please Type or paste your text here and click the submit button below!">"It is reported that the number of teenage smokers has been on the rise in recent years,which has caused great concern among people in ail walks or life.There are several reasons that account for this fact,but the following three may be the main ones.
First of all,it is easy for teenagers to get cigarettes.Cigarettes are available almost everywhere.Today's teens have more spare money,which comes from the improved living standard of their parents.They can buy what they want,includingcigarettes.Second,teenagers smoke because their adolescent years are filled with psychological problems.One of these problems,for example,is establishing a sense of identity.The teen years are the time when young people want to be more independent from their parents and form their ownvalues.The enormous mental pressures of these years can make some people turn to smoking.A final,and perhaps most important,reason is peer pressure to conform.Teens often become very close to special friends,for one thing,and they will share a friend's interest,even if one of these is smoking.Teenagers also attend parties and other social gatherings where it is all important to be one of the crowd,to be ""cool."" Even the most mature teenager might be tempted to smoke than to risk being an outcast.For all these reasons,cigarettes are a major problem facing teenagers"
										</textarea>
                                        <table style="width: 98%">
                                            <tr>
                                                <td style="text-align: left; padding: 5px;">
                                                    <div>
                                                        (<span style="color: blue">Limit: 100,000 Words</span>)
                                                        &nbsp;&nbsp;
                                                        <span id="mywords" style="display: none;">
                                                            <span id="wcount" style="color: red">Entered：0 Words;</span>
                                                            <span id="lcount" style="color: green">Remaining: 30,000 Words</span>
                                                        </span>
                                                    </div>
                                                </td>
                                                <td style="text-align: right; padding-right: 10px;">
                                                    <asp:Button ID="clearBtn" runat="server" Text="Clear" CssClass="outbtndiv-button" ToolTip="Clear the Texts" />
                                                    <asp:Button ID="lemmanew" runat="server" Text="Submit" CssClass="outbtndiv-button" ToolTip="Submit to Process" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <%-- 输出结果 --%>
                                <div id="outputDiv" runat="server" visible="false" class="wbdiv">

                                    <div class="divmain">
                                        <div class="it-ec-textdiv" id="divContext" runat="server">
                                            <span class="RB UN It">It</span><span class="RB A1 is"> is</span><span class="RB A1 reported"> reported</span><span class="RB A1 that"> that</span><span class="RB UN the"> the</span><span class="RB A1 number"> number</span><span class="RB A1 of"> of</span><span class="RB UN teenage"> teenage</span><span class="RB A1 smokers"> smokers</span><span class="RB A1 has"> has</span><span class="RB A1 been"> been</span><span class="RB A1 on"> on</span><span class="RB UN the"> the</span><span class="RB A1 rise"> rise</span><span class="RB A1 in"> in</span><span class="RB A1 recent"> recent</span><span class="RB A1 years"> years</span><span class="RB A1 which"> which</span><span class="RB A1 has"> has</span><span class="RB A1 caused"> caused</span><span class="RB A1 great"> great</span><span class="RB A2 concern"> concern</span><span class="RB A1 among"> among</span><span class="RB A1 people"> people</span><span class="RB A1 in"> in</span><span class="RB C2 ail"> ail</span><span class="RB A1 walks"> walks</span><span class="RB A1 or"> or</span><span class="RB A1 life"> life</span><span class="RB UN There"> There</span><span class="RB A1 are"> are</span><span class="RB A1 several"> several</span><span class="RB A1 reasons"> reasons</span><span class="RB A1 that"> that</span><span class="RB A1 account"> account</span><span class="RB A1 for"> for</span><span class="RB A1 this"> this</span><span class="RB A1 fact"> fact</span><span class="RB A1 but"> but</span><span class="RB UN the"> the</span><span class="RB A1 following"> following</span><span class="RB A1 three"> three</span><span class="RB UN may"> may</span><span class="RB A1 be"> be</span><span class="RB UN the"> the</span><span class="RB A1 main"> main</span><span class="RB A1 ones"> ones</span><span class="RB UN First"> First</span><span class="RB A1 of"> of</span><span class="RB A1 all"> all</span><span class="RB A1 it"> it</span><span class="RB A1 is"> is</span><span class="RB A1 easy"> easy</span><span class="RB A1 for"> for</span><span class="RB A1 teenagers"> teenagers</span><span class="RB A1 to"> to</span><span class="RB A1 get"> get</span><span class="RB A1 cigarettes"> cigarettes</span><span class="RB UN Cigarettes"> Cigarettes</span><span class="RB A1 are"> are</span><span class="RB A2 available"> available</span><span class="RB A1 almost"> almost</span><span class="RB A1 everywhere"> everywhere</span><span class="RB UN Today"> Today's</span><span class="RB C1 teens"> teens</span><span class="RB A1 have"> have</span><span class="RB A1 more"> more</span><span class="RB A1 spare"> spare</span><span class="RB A1 money"> money</span><span class="RB A1 which"> which</span><span class="RB A1 comes"> comes</span><span class="RB A1 from"> from</span><span class="RB UN the"> the</span><span class="RB A1 improved"> improved</span><span class="RB A1 living"> living</span><span class="RB A1 standard"> standard</span><span class="RB A1 of"> of</span><span class="RB A1 their"> their</span><span class="RB A1 parents"> parents</span><span class="RB UN They"> They</span><span class="RB A1 can"> can</span><span class="RB A1 buy"> buy</span><span class="RB A1 what"> what</span><span class="RB A1 they"> they</span><span class="RB A1 want"> want</span><span class="RB C1 includingcigarettes"> includingcigarettes</span><span class="RB UN Second"> Second</span><span class="RB A1 teenagers"> teenagers</span><span class="RB A1 smoke"> smoke</span><span class="RB A1 because"> because</span><span class="RB A1 their"> their</span><span class="RB B1 adolescent"> adolescent</span><span class="RB A1 years"> years</span><span class="RB A1 are"> are</span><span class="RB A1 filled"> filled</span><span class="RB A1 with"> with</span><span class="RB A2 psychological"> psychological</span><span class="RB A1 problems"> problems</span><span class="RB UN One"> One</span><span class="RB A1 of"> of</span><span class="RB A1 these"> these</span><span class="RB A1 problems"> problems</span><span class="RB A1 for"> for</span><span class="RB A1 example"> example</span><span class="RB A1 is"> is</span><span class="RB A2 establishing"> establishing</span><span class="RB A1 a"> a</span><span class="RB A1 sense"> sense</span><span class="RB A1 of"> of</span><span class="RB A2 identity"> identity</span><span class="RB UN The"> The</span><span class="RB C1 teen"> teen</span><span class="RB A1 years"> years</span><span class="RB A1 are"> are</span><span class="RB UN the"> the</span><span class="RB A1 time"> time</span><span class="RB A1 when"> when</span><span class="RB A1 young"> young</span><span class="RB A1 people"> people</span><span class="RB A1 want"> want</span><span class="RB A1 to"> to</span><span class="RB A1 be"> be</span><span class="RB A1 more"> more</span><span class="RB A1 independent"> independent</span><span class="RB A1 from"> from</span><span class="RB A1 their"> their</span><span class="RB A1 parents"> parents</span><span class="RB A1 and"> and</span><span class="RB A1 form"> form</span><span class="RB A1 their"> their</span><span class="RB C1 ownvalues"> ownvalues</span><span class="RB UN The"> The</span><span class="RB A2 enormous"> enormous</span><span class="RB A1 mental"> mental</span><span class="RB A1 pressures"> pressures</span><span class="RB A1 of"> of</span><span class="RB A1 these"> these</span><span class="RB A1 years"> years</span><span class="RB A1 can"> can</span><span class="RB A1 make"> make</span><span class="RB A1 some"> some</span><span class="RB A1 people"> people</span><span class="RB A1 turn"> turn</span><span class="RB A1 to"> to</span><span class="RB A1 smoking"> smoking</span><span class="RB UN A"> A</span><span class="RB A1 final"> final</span><span class="RB A1 and"> and</span><span class="RB A1 perhaps"> perhaps</span><span class="RB A1 most"> most</span><span class="RB A1 important"> important</span><span class="RB A1 reason"> reason</span><span class="RB A1 is"> is</span><span class="RB A2 peer"> peer</span><span class="RB A1 pressure"> pressure</span><span class="RB A1 to"> to</span><span class="RB B1 conform"> conform</span><span class="RB UN Teens"> Teens</span><span class="RB A1 often"> often</span><span class="RB A1 become"> become</span><span class="RB A1 very"> very</span><span class="RB A1 to"> to</span><span class="RB A1 special"> special</span><span class="RB A1 friends"> friends</span><span class="RB A1 for"> for</span><span class="RB A1 one"> one</span><span class="RB A1 thing"> thing</span><span class="RB A1 and"> and</span><span class="RB A1 they"> they</span><span class="RB A1 will"> will</span><span class="RB A1 share"> share</span><span class="RB A1 a"> a</span><span class="RB UN friend"> friend's</span><span class="RB A1 interest"> interest</span><span class="RB A1 even"> even</span><span class="RB A1 if"> if</span><span class="RB A1 one"> one</span><span class="RB A1 of"> of</span><span class="RB A1 these"> these</span><span class="RB A1 is"> is</span><span class="RB A1 smoking"> smoking</span><span class="RB UN Teenagers"> Teenagers</span><span class="RB C2 also"> also</span><span class="RB A1 attend"> attend</span><span class="RB A1 parties"> parties</span><span class="RB A1 and"> and</span><span class="RB A1 other"> other</span><span class="RB A1 social"> social</span><span class="RB C2 gatherings"> gatherings</span><span class="RB A1 where"> where</span><span class="RB A1 it"> it</span><span class="RB A1 is"> is</span><span class="RB A1 all"> all</span><span class="RB A1 important"> important</span><span class="RB A1 to"> to</span><span class="RB A1 be"> be</span><span class="RB A1 one"> one</span><span class="RB A1 of"> of</span><span class="RB UN the"> the</span><span class="RB A1 crowd"> crowd</span><span class="RB A1 to"> to</span><span class="RB A1 be"> be</span><span class="RB A1 cool"> cool</span><span class="RB UN Even"> Even</span><span class="RB UN the"> the</span><span class="RB A1 most"> most</span><span class="RB A2 mature"> mature</span><span class="RB A1 teenager"> teenager</span><span class="RB A1 might"> might</span><span class="RB A1 be"> be</span><span class="RB B1 tempted"> tempted</span><span class="RB A1 to"> to</span><span class="RB A1 smoke"> smoke</span><span class="RB A1 than"> than</span><span class="RB A1 to"> to</span><span class="RB A1 risk"> risk</span><span class="RB A1 being"> being</span><span class="RB A1 an"> an</span><span class="RB C2 outcast"> outcast</span><span class="RB UN For"> For</span><span class="RB A1 all"> all</span><span class="RB A1 these"> these</span><span class="RB A1 reasons"> reasons</span><span class="RB A1 cigarettes"> cigarettes</span><span class="RB A1 are"> are</span><span class="RB A1 a"> a</span><span class="RB A1 major"> major</span><span class="RB A1 problem"> problem</span><span class="RB A1 facing"> facing</span><span class="RB A1 teenagers"> teenagers</span><span class="RB UN It"> It</span><span class="RB A1 is"> is</span><span class="RB A1 reported"> reported</span><span class="RB A1 that"> that</span><span class="RB UN the"> the</span><span class="RB A1 number"> number</span><span class="RB A1 of"> of</span><span class="RB UN teenage"> teenage</span><span class="RB A1 smokers"> smokers</span><span class="RB A1 has"> has</span><span class="RB A1 been"> been</span><span class="RB A1 on"> on</span><span class="RB UN the"> the</span><span class="RB A1 rise"> rise</span><span class="RB A1 in"> in</span><span class="RB A1 recent"> recent</span><span class="RB A1 years"> years</span><span class="RB A1 which"> which</span><span class="RB A1 has"> has</span><span class="RB A1 caused"> caused</span><span class="RB A1 great"> great</span><span class="RB A2 concern"> concern</span><span class="RB A1 among"> among</span><span class="RB A1 people"> people</span><span class="RB A1 in"> in</span><span class="RB C2 ail"> ail</span><span class="RB A1 walks"> walks</span><span class="RB A1 or"> or</span><span class="RB A1 life"> life</span><span class="RB UN There"> There</span><span class="RB A1 are"> are</span><span class="RB A1 several"> several</span><span class="RB A1 reasons"> reasons</span><span class="RB A1 that"> that</span><span class="RB A1 account"> account</span><span class="RB A1 for"> for</span><span class="RB A1 this"> this</span><span class="RB A1 fact"> fact</span><span class="RB A1 but"> but</span><span class="RB UN the"> the</span><span class="RB A1 following"> following</span><span class="RB A1 three"> three</span><span class="RB UN may"> may</span><span class="RB A1 be"> be</span><span class="RB UN the"> the</span><span class="RB A1 main"> main</span><span class="RB A1 ones"> ones</span><span class="RB UN First"> First</span><span class="RB A1 of"> of</span><span class="RB A1 all"> all</span><span class="RB A1 it"> it</span><span class="RB A1 is"> is</span><span class="RB A1 easy"> easy</span><span class="RB A1 for"> for</span><span class="RB A1 teenagers"> teenagers</span><span class="RB A1 to"> to</span><span class="RB A1 get"> get</span><span class="RB A1 cigarettes"> cigarettes</span><span class="RB UN Cigarettes"> Cigarettes</span><span class="RB A1 are"> are</span><span class="RB A2 available"> available</span><span class="RB A1 almost"> almost</span><span class="RB A1 everywhere"> everywhere</span><span class="RB UN Today"> Today's</span><span class="RB C1 teens"> teens</span><span class="RB A1 have"> have</span><span class="RB A1 more"> more</span><span class="RB A1 spare"> spare</span><span class="RB A1 money"> money</span><span class="RB A1 which"> which</span><span class="RB A1 comes"> comes</span><span class="RB A1 from"> from</span><span class="RB UN the"> the</span><span class="RB A1 improved"> improved</span><span class="RB A1 living"> living</span><span class="RB A1 standard"> standard</span><span class="RB A1 of"> of</span><span class="RB A1 their"> their</span><span class="RB A1 parents"> parents</span><span class="RB UN They"> They</span><span class="RB A1 can"> can</span><span class="RB A1 buy"> buy</span><span class="RB A1 what"> what</span><span class="RB A1 they"> they</span><span class="RB A1 want"> want</span><span class="RB C1 includingcigarettes"> includingcigarettes</span><span class="RB UN Second"> Second</span><span class="RB A1 teenagers"> teenagers</span><span class="RB A1 smoke"> smoke</span><span class="RB A1 because"> because</span><span class="RB A1 their"> their</span><span class="RB B1 adolescent"> adolescent</span><span class="RB A1 years"> years</span><span class="RB A1 are"> are</span><span class="RB A1 filled"> filled</span><span class="RB A1 with"> with</span><span class="RB A2 psychological"> psychological</span><span class="RB A1 problems"> problems</span><span class="RB UN One"> One</span><span class="RB A1 of"> of</span><span class="RB A1 these"> these</span><span class="RB A1 problems"> problems</span><span class="RB A1 for"> for</span><span class="RB A1 example"> example</span><span class="RB A1 is"> is</span><span class="RB A2 establishing"> establishing</span><span class="RB A1 a"> a</span><span class="RB A1 sense"> sense</span><span class="RB A1 of"> of</span><span class="RB A2 identity"> identity</span><span class="RB UN The"> The</span><span class="RB C1 teen"> teen</span><span class="RB A1 years"> years</span><span class="RB A1 are"> are</span><span class="RB UN the"> the</span><span class="RB A1 time"> time</span><span class="RB A1 when"> when</span><span class="RB A1 young"> young</span><span class="RB A1 people"> people</span><span class="RB A1 want"> want</span><span class="RB A1 to"> to</span><span class="RB A1 be"> be</span><span class="RB A1 more"> more</span><span class="RB A1 independent"> independent</span><span class="RB A1 from"> from</span><span class="RB A1 their"> their</span><span class="RB A1 parents"> parents</span><span class="RB A1 and"> and</span><span class="RB A1 form"> form</span><span class="RB A1 their"> their</span><span class="RB C1 ownvalues"> ownvalues</span><span class="RB UN The"> The</span><span class="RB A2 enormous"> enormous</span><span class="RB A1 mental"> mental</span><span class="RB A1 pressures"> pressures</span><span class="RB A1 of"> of</span><span class="RB A1 these"> these</span><span class="RB A1 years"> years</span><span class="RB A1 can"> can</span><span class="RB A1 make"> make</span><span class="RB A1 some"> some</span><span class="RB A1 people"> people</span><span class="RB A1 turn"> turn</span><span class="RB A1 to"> to</span><span class="RB A1 smoking"> smoking</span><span class="RB UN A"> A</span><span class="RB A1 final"> final</span><span class="RB A1 and"> and</span><span class="RB A1 perhaps"> perhaps</span><span class="RB A1 most"> most</span><span class="RB A1 important"> important</span><span class="RB A1 reason"> reason</span><span class="RB A1 is"> is</span><span class="RB A2 peer"> peer</span><span class="RB A1 pressure"> pressure</span><span class="RB A1 to"> to</span><span class="RB B1 conform"> conform</span><span class="RB UN Teens"> Teens</span><span class="RB A1 often"> often</span><span class="RB A1 become"> become</span><span class="RB A1 very"> very</span><span class="RB A1 to"> to</span><span class="RB A1 special"> special</span><span class="RB A1 friends"> friends</span><span class="RB A1 for"> for</span><span class="RB A1 one"> one</span><span class="RB A1 thing"> thing</span><span class="RB A1 and"> and</span><span class="RB A1 they"> they</span><span class="RB A1 will"> will</span><span class="RB A1 share"> share</span><span class="RB A1 a"> a</span><span class="RB UN friend"> friend's</span><span class="RB A1 interest"> interest</span><span class="RB A1 even"> even</span><span class="RB A1 if"> if</span><span class="RB A1 one"> one</span><span class="RB A1 of"> of</span><span class="RB A1 these"> these</span><span class="RB A1 is"> is</span><span class="RB A1 smoking"> smoking</span><span class="RB UN Teenagers"> Teenagers</span><span class="RB C2 also"> also</span><span class="RB A1 attend"> attend</span><span class="RB A1 parties"> parties</span><span class="RB A1 and"> and</span><span class="RB A1 other"> other</span><span class="RB A1 social"> social</span><span class="RB C2 gatherings"> gatherings</span><span class="RB A1 where"> where</span><span class="RB A1 it"> it</span><span class="RB A1 is"> is</span><span class="RB A1 all"> all</span><span class="RB A1 important"> important</span><span class="RB A1 to"> to</span><span class="RB A1 be"> be</span><span class="RB A1 one"> one</span><span class="RB A1 of"> of</span><span class="RB UN the"> the</span><span class="RB A1 crowd"> crowd</span><span class="RB A1 to"> to</span><span class="RB A1 be"> be</span><span class="RB A1 cool"> cool</span><span class="RB UN Even"> Even</span><span class="RB UN the"> the</span><span class="RB A1 most"> most</span><span class="RB A2 mature"> mature</span><span class="RB A1 teenager"> teenager</span><span class="RB A1 might"> might</span><span class="RB A1 be"> be</span><span class="RB B1 tempted"> tempted</span><span class="RB A1 to"> to</span><span class="RB A1 smoke"> smoke</span><span class="RB A1 than"> than</span><span class="RB A1 to"> to</span><span class="RB A1 risk"> risk</span><span class="RB A1 being"> being</span><span class="RB A1 an"> an</span><span class="RB C2 outcast"> outcast</span><span class="RB UN For"> For</span><span class="RB A1 all"> all</span><span class="RB A1 these"> these</span><span class="RB A1 reasons"> reasons</span><span class="RB A1 cigarettes"> cigarettes</span><span class="RB A1 are"> are</span><span class="RB A1 a"> a</span><span class="RB A1 major"> major</span><span class="RB A1 problem"> problem</span><span class="RB A1 facing"> facing</span><span class="RB A1 teenagers"> teenagers</span>
                                        </div>
                                        <div class="it-ec-statsdiv" id="divstats">
                                            <div class="outbtndiv">
                                                <input id="btnLight" type="button" value="HighLight" data-i="1" onclick="HighLightAll(this)" class="outbtndiv-button" />
                                                <asp:Button ID="btnBackLemma" runat="server" Text="Back" CssClass="outbtndiv-button" ToolTip="关闭页面" />
                                                <asp:Button ID="btnCloseLemma" runat="server" Text="Close" CssClass="outbtndiv-button" ToolTip="关闭页面" />
                                            </div>
                                            <dl class="it-chart-dl" id="dlChart" runat="server">
                                                <dt class="it-chart-dt" data-grade="UN" onclick="HighLightthis(this)">忽略处理</dt>
                                                <dd class="it-chart-dd" data-grade="UN" onclick="HighLightthis(this)">
                                                    <div class="it-chart-bar" style="background-color: grey; width: 11.1588%;"></div>
                                                    <div class="it-chart-label">26(11.16%)</div>
                                                </dd>
                                                <dt class="it-chart-dt" data-grade="C1" onclick="HighLightthis(this)">未处理</dt>
                                                <dd class="it-chart-dd" data-grade="C1" onclick="HighLightthis(this)">
                                                    <div class="it-chart-bar" style="background-color: orange; width: 2.5751%;"></div>
                                                    <div class="it-chart-label">6(2.58%)</div>
                                                </dd>
                                                <dt class="it-chart-dt" data-grade="C2" onclick="HighLightthis(this)">超纲词汇</dt>
                                                <dd class="it-chart-dd" data-grade="C2" onclick="HighLightthis(this)">
                                                    <div class="it-chart-bar" style="background-color: red; width: 1.7167%;"></div>
                                                    <div class="it-chart-label">4(1.72%)</div>
                                                </dd>
                                                <dt class="it-chart-dt" data-grade="A1" onclick="HighLightthis(this)">高中大纲</dt>
                                                <dd class="it-chart-dd" data-grade="A1" onclick="HighLightthis(this)">
                                                    <div class="it-chart-bar" style="background-color: indigo; width: 99.8283%; max-width: unset"></div>
                                                    <div class="it-chart-label">186(88.83%)</div>
                                                </dd>
                                                <dt class="it-chart-dt" data-grade="A2" onclick="HighLightthis(this)">基本要求</dt>
                                                <dd class="it-chart-dd" data-grade="A2" onclick="HighLightthis(this)">
                                                    <div class="it-chart-bar" style="background-color: blue; width: 3.4335%;"></div>
                                                    <div class="it-chart-label">8(3.43%)</div>
                                                </dd>
                                                <dt class="it-chart-dt" data-grade="B1" onclick="HighLightthis(this)">较高要求</dt>
                                                <dd class="it-chart-dd" data-grade="B1" onclick="HighLightthis(this)">
                                                    <div class="it-chart-bar" style="background-color: green; width: 1.2876%;"></div>
                                                    <div class="it-chart-label">3(1.29%)</div>
                                                </dd>
                                                <dt class="it-chart-dt" data-grade="B2" onclick="HighLightthis(this)">更高要求</dt>
                                                <dd class="it-chart-dd" data-grade="B2" onclick="HighLightthis(this)">
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
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
