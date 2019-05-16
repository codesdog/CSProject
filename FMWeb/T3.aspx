<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="T3.aspx.cs" Inherits="FMWeb.T3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="drawpie.css" type="text/css" rel="stylesheet"/>
    <link href="jquery-ui-1.8.11.custom.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="drawpie.js" charset="utf-8" ></script>
    <script type="text/javascript">
        function colordThis(obj) {
            var color = obj.style.backgroundcolor;
            var textdiv = document.getElementById("divContext");
            var spans = textdiv.find("span");
            
        }
        function getspanclass(thisobj) {
            var setValue = "";
            setValue = thisobj.getAttribute("data-grade");            
            var obj = js("<%=divContext.ClientID%>");
            var oldClass = "";
            var newClass = "";
                for (i in obj) {
                    oldClass = obj[i].className;
                    var classArr = oldClass.trim().split(/\s+/);
                    if (classArr.indexOf(setValue) > -1) {
                        if (classArr.indexOf("highlight") > -1) {//已经是加颜色,本次操作将去掉颜色
                            newClass = oldClass.replace("highlight", "");
                            obj[i].classList.remove("highlight");
                        }
                        else {//未颜色,本次操作将增加颜色
                            newClass = oldClass + "highlight";
                            obj[i].classList.add("highlight");
                        }                 
                    }
                }
            
        }
        function js(id) {
            return document.getElementById(id).getElementsByTagName("span");
        }

        function setAllSpan(val) {
            var obj = js("<%=divContext.ClientID%>");
            var oldClass = "";
            var newClass = "";
            for (i in obj) {
                if (val == 0) {
                    obj[i].classList.remove("highlight");
                }
                else {
                    obj[i].classList.add("highlight");
                }                
            }            
        }
    </script>
    <div class="it-ec-textdiv" id="divContext" runat="server">
        <p class="it-ec-paragraph"><strong>id="A00" title="[ACET factsheets &amp; newsletters]. Sample containing about 6894 words of miscellanea (domain: social science) " date="1991-09" type="W non ac medicine"</strong><br><span class="IN A1 on"> on</span><span class="VVG A1 sell"> selling</span><span class="RB A1 too"> too</span><span class="RB A1 much"> much</span><span class="IN A1 at"> at</span><span class="NP UN more_than"> more than</span><span class="NP UN 10p"> 10p</span><span class="DT A1 an"> an</span><span class="NN B1 item"> item</span><span class="SENT UN .">.</span><span class="LS UN 3"> 3</span><span class="SENT UN .">.</span><span class="VVN B2 sponsor"> SPONSORED</span><span class="NN A1 run"> RUN</span><span class="NN UN &amp;mdash;"> —</span><span class="IN A1 for"> For</span><span class="DT A1 the"> the</span><span class="JJ A2 keen"> keen</span><span class="NN A1 fun"> fun</span><span class="NN C1 runner highlight"> runner</span><span class=", UN ,">,</span><span class="WRB A1 why"> why</span><span class="RB A1 not"> not</span><span class="VV A1 get"> get</span><span class="PP$ A1 your"> your</span><span class="JJ A1 next"> next</span><span class="JJ A1 full"> full</span><span class="CC A1 or"> or</span><span class="JJ A1 half"> half</span><span class="NN UN marathon"> marathon</span><span class="VVN B2 sponsor"> sponsored</span><span class="SENT UN .">.</span><span class="LS UN 4"> 4</span><span class="SENT UN .">.</span><span class="VHP A1 have"> HAVE</span><span class="DT A1 a"> A</span><span class="NP UN DISCO"> DISCO</span><span class="NN UN &amp;mdash;"> —</span><span class="IN A1 at"> At</span><span class="PP$ A1 your"> your</span><span class="JJ B1 local"> local</span><span class="NN A1 club"> club</span><span class="CC A1 or"> or</span><span class="NN A1 church"> church</span><span class="WRB A1 why"> why</span><span class="RB A1 not"> not</span><span class="VVN A1 put"> put</span><span class="IN A1 on"> on</span><span class="DT A1 an"> an</span><span class="NN A1 evening"> evening</span><span class="IN A1 for"> for</span><span class="JJ A1 young"> young</span><span class="NNS A1 people"> people</span><span class="SENT UN ?">?</span><span class="PP A1 it"> It</span><span class="NNS UN 's"> 's</span><span class="JJ A1 hard"> hard</span><span class="NN A1 work"> work</span><span class="CC A1 but"> but</span><span class="RB A1 very"> very</span><span class="JJ C2 rewarding"> rewarding</span><span class="SENT UN .">.</span><span class="LS UN 5"> 5</span><span class="SENT UN .">.</span><span class="DT A1 a"> A</span><span class="NP UN PARACHUTE"> PARACHUTE</span><span class="NP UN Jump"> JUMP</span><span class="NN UN &amp;mdash;"> —</span><span class="RB A1 not"> Not</span><span class="IN A1 for"> for</span><strong><span class="DT A1 the"> the</span></strong><span class="JJ UN faint-hearted"> faint-hearted</span><span class="SENT UN .">.</span><span class="CC A1 but"> But</span><span class="WRB A1 why"> why</span><span class="RB A1 not"> not</span><span class="VV UN pluck"> pluck</span><span class="RP A1 up"> up</span><span class="DT A1 the"> the</span><span class="NN B2 courage"> courage</span><span class="TO A1 to"> to</span><span class="VV A1 do"> do</span><span class="WP A1 what"> what</span><span class="PP A1 you"> you</span><span class="VV UN 've"> 've</span><span class="RB A1 always"> always</span><span class="VVN A1 want"> wanted</span><span class="SENT UN ?">?</span><span class="PP A1 it"> It</span><span class="NNS UN 's"> 's</span><span class="RB A1 all"> all</span><span class="IN B1 in"> in</span><span class="DT A1 a"> a</span><span class="JJ A1 good"> good</span><span class="NN B1 cause"> cause</span><span class="SENT UN .">.</span><span class="CD UN 6"> 6</span><span class="SENT UN .">.</span><span class="VVN B2 sponsor"> SPONSORED</span><span class="NP UN Slim"> SLIM</span><span class="CD UN 7"> 7</span><span class="SENT UN .">.</span><span class="VV A1 hold"> HOLD</span><span class="DT A1 a"> A</span><span class="NP UN Coffee"> COFFEE</span><span class="NP UN Morning"> MORNING</span><span class="CC A1 or"> or</span><span class="NP UN Bake"> BAKE</span><span class="NNS A2 cake"> CAKES</span><span class="TO A1 to"> to</span><span class="VV A1 sell"> sell</span><span class="TO A1 to"> to</span><span class="VV A1 work"> work</span><span class="NNS A2 colleague"> colleagues</span><span class="SENT UN .">.</span><span class="CD UN 8"> 8</span><span class="SENT UN .">.</span><span class="NNS UN kiddy"> KIDDIES</span><span class="JJ UN '"> '</span><span class="NP UN SPONSORED"> SPONSORED</span><span class="NP UN Swim"> SWIM</span><span class="CD UN 9"> 9</span><span class="SENT UN .">.</span><span class="VV UN organize"> Organise</span><span class="DT A1 a"> a</span><span class="NP UN SPONSORED"> SPONSORED</span><span class="NP UN Walk"> WALK</span><span class="NP UN Or"> OR</span><span class="NP UN RAMBLE"> RAMBLE</span><span class="IN A1 for"> for</span><span class="PP$ A1 your"> your</span><span class="NN A1 church"> church</span><span class="CC A1 or"> or</span><span class="NN B1 youth"> youth</span><span class="NN A1 club"> club</span><span class="SENT UN .">.</span><span class="CD UN @card@"> 10</span><span class="SENT UN .">.</span><span class="VVN B2 sponsor"> SPONSORED</span><span class="NP UN DISCO"> DISCO</span><span class="NP UN Marathon"> MARATHON</span><span class="CC A1 or"> or</span><span class="NP UN Football"> FOOTBALL</span><span class="NN UN 5-A-SIDE"> 5-A-SIDE</span><span class="SENT UN .">.</span><span class="IN A1 if"> If</span><span class="PP A1 I"> I</span><span class="MD A1 can"> can</span><span class="VV A1 help"> help</span><span class="RBR B1 further"> further</span><span class="VV A1 please"> please</span><span class="VVP A1 do"> do</span><span class="RB A1 not"> not</span><span class="VV C1 hesitate highlight"> hesitate</span><span class="TO A1 to"> to</span><span class="VV B1 contact"> contact</span><span class="PP A1 me"> me</span><span class="IN A1 on"> on</span><span class="CD UN @card@"> 081</span><span class="CD UN @card@"> 840</span><span class="CD UN @card@"> 7879</span><span class="NP UN Peter"> Peter</span><span class="NP UN Fabian"> Fabian</span><span class="NP UN Director"> Director</span><span class="IN A1 of"> of</span><span class="NP UN Fundraising"> Fundraising</span><span class="NP UN FACTSHEET"> FACTSHEET</span><span class="NP UN BECOMING"> BECOMING</span><span class="DT A1 an"> AN</span><span class="NP UN ACET"> ACET</span><span class="NP UN HOME"> HOME</span><span class="NP UN CARE"> CARE</span><span class="NP UN VOLUNTEER"> VOLUNTEER</span><span class="IN A1 about"> About</span><span class="NP UN ACET"> ACET</span><span class="NP UN 's"> 's</span><span class="NP UN Home"> Home</span><span class="NP UN Care"> Care</span><span class="JJ UN Many"> Many</span><span class="NNS A1 people"> people</span><span class="IN A1 with"> with</span><span class="NP C2 AIDS"> AIDS</span><span class="VHP A1 have"> have</span><span class="TO A1 to"> to</span><span class="VV A1 spend"> spend</span><span class="JJ A1 long"> long</span><span class="NNS B1 period"> periods</span><span class="IN A1 of"> of</span><span class="NN A1 time"> time</span><span class="IN B1 in"> in</span><span class="NN A2 hospital"> hospital</span><span class="IN A1 unless"> unless</span><span class="EX A1 there"> there</span><span class="VBZ A1 be"> is</span><span class="NN A1 someone"> someone</span><span class="IN A1 at"> at</span><span class="NN B1 home"> home</span><span class="WP A1 who"> who</span><span class="MD A1 can"> can</span><span class="VV A1 help"> help</span><span class="CC A1 and"> and</span><span class="VV A1 look"> look</span><span class="IN A1 after"> after</span><span class="PP A2 them"> them</span><span class="SENT UN .">.</span><span class="NN UN ACET"> ACET</span><span class="NNS A2 volunteer"> volunteers</span><span class="VVP A1 work"> work</span><span class="IN A1 as"> as</span><span class="NN A1 part"> part</span><span class="IN A1 of"> of</span><span class="DT A1 a"> a</span><span class="NN A2 team"> team</span><span class="CC A1 and"> and</span><span class="VV A1 provide"> provide</span><span class="NN A1 help"> help</span><span class="IN B1 in"> in</span><span class="JJ A1 many"> many</span><span class="JJ A1 different"> different</span><span class="NNS A1 way"> ways</span><span class="TO A1 to"> to</span><span class="VV A1 ensure"> ensure</span><span class="DT A1 that"> that</span><span class="NNS A1 people"> people</span><span class="VVP A1 do"> do</span><span class="NN UN n't"> n't</span><span class="VV A1 spend"> spend</span><span class="NN A1 time"> time</span><span class="IN B1 in"> in</span><span class="NN A2 hospital"> hospital</span><span class="RB C2 unnecessarily"> unnecessarily</span><span class="SENT UN .">.</span><span class="WP UN What"> What</span><span class="VVP A1 do"> do</span><span class="NP UN ACET"> ACET</span><span class="NNS A2 volunteer"> volunteers</span><span class="VVP A1 do"> do</span><span class="SENT UN ?">?</span><span class="NN B1 transport"> Transport</span><span class="NNS A1 client"> clients</span><span class="TO A1 to"> to</span><span class="CC A1 and"> and</span><span class="IN A1 from"> from</span><span class="NN A2 hospital"> hospital</span><span class="NN UN housework"> Housework</span><span class="NN A2 shopping"> Shopping</span><span class="VVG A1 include"> including</span><span class="NN B1 collection"> collection</span><span class="IN A1 of"> of</span><span class="NNS C1 prescription highlight"> prescriptions</span><span class="NN UN Daysitting"> Daysitting</span><span class="CC A1 and"> and</span><span class="NN UN nightsitting"> nightsitting</span><span class="WRB UN How"> How</span><span class="JJ A1 much"> much</span><span class="NN A1 time"> time</span><span class="TO A1 to"> to</span><span class="PP A1 I"> I</span><span class="VVP A1 need"> need</span><span class="TO A1 to"> to</span><span class="VV A1 give"> give</span><span class="SENT UN ?">?</span><span class="DT A1 the"> The</span><span class="JJ A2 simple"> simple</span><span class="NN A1 answer"> answer</span><span class="VBZ A1 be"> is</span><span class="RB A1 as"> as</span><span class="JJ A1 much"> much</span><span class="CC A1 or"> or</span><span class="RB A1 as"> as</span><span class="JJ A1 little"> little</span><span class="IN A1 as"> as</span><span class="PP A1 you"> you</span><span class="VVP A1 feel"> feel</span><span class="JJ A1 able"> able</span><span class="TO A1 to"> to</span><span class="VV A1 give"> give</span><span class="SENT UN .">.</span><span class="JJ UN Many"> Many</span><span class="IN A1 of"> of</span><span class="PP$ A1 our"> our</span><span class="JJ A2 existing"> existing</span><span class="NNS A2 volunteer"> volunteers</span><span class="VHP A1 have"> have</span><span class="NNS A1 family"> families</span><span class="CC A1 and"> and</span><span class="NNS A1 job"> jobs</span><span class="CC A1 and"> and</span><span class="VBP A1 be"> are</span><span class="RB A1 often"> often</span><span class="RB A1 very"> very</span><span class="JJ A2 busy"> busy</span><span class="SENT UN .">.</span><span class="PP A1 you"> You</span><span class="VVP A1 do"> do</span><span class="NN UN n't"> n't</span><span class="VHP A1 have"> have</span><span class="TO A1 to"> to</span><span class="VV A1 make"> make</span><span class="DT A1 a"> a</span><span class="NN A2 firm"> firm</span><span class="NN B2 commitment"> commitment</span><span class="CC A1 but"> but</span><span class="RB A2 obviously"> obviously</span><span class="PP A1 we"> we</span><span class="VVP A1 like"> like</span><span class="PP A1 you"> you</span><span class="TO A1 to"> to</span><span class="VV A1 give"> give</span><span class="PP A1 us"> us</span><span class="DT A1 some"> some</span><span class="NN A1 idea"> idea</span><span class="IN A1 of"> of</span><span class="PP$ A1 your"> your</span><span class="NN B1 availability"> availability</span><span class="SENT UN .">.</span><span class="DT A1 this"> This</span><span class="VBZ A1 be"> is</span><span class="RB A1 so"> so</span><span class="PP A1 we"> we</span><span class="MD A1 can"> can</span><span class="VV B2 respond"> respond</span><span class="RB A2 effectively"> effectively</span><span class="TO A1 to"> to</span><span class="DT A1 the"> the</span><span class="NNS A1 need"> needs</span><span class="IN A1 of"> of</span><span class="PP$ A1 our"> our</span><span class="NNS A1 client"> clients</span><span class="SENT UN .">.</span><span class="VV A1 do"> Do</span><span class="PP A1 I"> I</span><span class="VV A1 need"> need</span><span class="DT A1 any"> any</span><span class="NN B1 training"> training</span><span class="SENT UN ?">?</span><span class="UH A1 yes"> Yes</span><span class="NN UN &amp;mdash;"> —</span><span class="CC A1 but"> but</span><span class="PP A1 you"> you</span><span class="VBP A1 be"> are</span><span class="RB A1 not"> not</span><span class="VVN A1 expect"> expected</span><span class="TO A1 to"> to</span><span class="VB A1 be"> be</span><span class="DT A1 a"> a</span><span class="NN B1 nurse"> nurse</span><span class="SENT UN .">.</span><span class="PP A1 you"> You</span><span class="MD A1 will"> will</span><span class="VB A1 be"> be</span></p>

    </div>
        
    <div class="it-ec-statsdiv" id="divstats" runat="server">
        <div>
            点击级别或色块可以标注彩色文本
                <input id="bt1" type="button" value="Set All" onclick="setAllSpan(1)" />
            <input id="bt2" type="button" value="Clear All" onclick="setAllSpan(0)" />
        </div>
        <dl class="it-chart-dl">
            <dt class="it-chart-dt" onclick="getspanclass(this)" title="C2">C2</dt>
            <dd class="it-chart-dd" title="C2" onclick="getspanclass(this)">
                <div class="it-chart-bar" style="background-color: red; width: 2.14681%;"></div>
                <div class="it-chart-label">3</div>
            </dd>
            <dt class="it-chart-dt" onclick="getspanclass(this)" title="C1">C1</dt>
            <dd class="it-chart-dd" title="C1" onclick="getspanclass(this)">
                <div class="it-chart-bar" style="background-color: orange; width: 0.715603%;"></div>
                <div class="it-chart-label">1</div>
            </dd>
            <dt class="it-chart-dt" onclick="getspanclass(this)">B2</dt>
            <dd class="it-chart-dd" id="B2" onclick="getspanclass(this)">
                <div class="it-chart-bar" style="background-color: yellow; width: 2.86241%;"></div>
                <div class="it-chart-label">4</div>
            </dd>
            <dt class="it-chart-dt" onclick="getspanclass(this)">B1</dt>
            <dd class="it-chart-dd" id="B1" onclick="getspanclass(this)">
                <div class="it-chart-bar" style="background-color: green; width: 7.87163%;"></div>
                <div class="it-chart-label">11</div>
            </dd>
            <dt class="it-chart-dt" onclick="getspanclass(this)">A2</dt>
            <dd class="it-chart-dd" id="A2" onclick="getspanclass(this)">
                <div class="it-chart-bar" style="background-color: blue; width: 5.00922%;"></div>
                <div class="it-chart-label">7</div>
            </dd>
            <dt class="it-chart-dt" onclick="getspanclass(this)" data-grade="A1">A1</dt>
            <dd class="it-chart-dd" data-grade="A1" onclick="getspanclass(this)">
                <div class="it-chart-bar" style="background-color: indigo; width: 60.8262%;"></div>
                <div class="it-chart-label">85</div>
            </dd>
            <dt class="it-chart-dt" data-grade="UN" onclick="getspanclass(this)">UN</dt>
            <dd class="it-chart-dd" data-grade="UN" onclick="getspanclass(this)">
                <div class="it-chart-bar" style="background-color: grey; width: 21.4681%;"></div>
                <div class="it-chart-label">30</div>
            </dd>
        </dl>
    </div>

</asp:Content>
