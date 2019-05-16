<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="T2.aspx.cs" Inherits="FMWeb.T2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .chartdiv {
            width: 100%;
        }

            .chartdiv dl {
                margin: 0;
                clear:left;
            }

                .chartdiv dl dt, .chartdiv dl dd {
                    display: inline;
                    margin: 0;
                    padding: 0;
                }                
                .chartdiv dl dt {
                    font-weight: bold;
                }

                    .chartdiv dl dt:after {
                        content: ": ";
                    }

                    .chartdiv dl dt:not(:first-child):before {
                        content: "\0A";
                        white-space: pre;
                    }
        .auto-style1 {
            height: 20px;
        }
        .auto-style2 {
            width: 20px;
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="chartdiv">
        <dl>
            <dt>C2</dt>
            <dd>
                <div style="background-color:red; width: 0.715603%;">1</div>
            </dd>
            <dt>C1</dt>
            <dd>
                <div style="background-color:orange; width: 1.43121%;">2</div>
            </dd>
            <dt>B2</dt>
            <dd>
                <div style="background-color:yellow; width: 3.57801%;">5</div>
            </dd>
            <dt >B1</dt>
            <dd >
                <div style="background-color:green; width: 12.1652%;color:white">17</div>
            </dd>
            <dt>A2</dt>
            <dd>
                <div style="background-color:blue; width: 7.87163%;color:white">11</div>
            </dd>
            <dt >A1</dt>
            <dd >
                <div style="background-color:indigo; width: 55.1014%;color:white">77</div>
            </dd>
            <dt>UN</dt>
            <dd>
                <div style="background-color:grey; width: 20.0369%;color:white">28</div>
            </dd>
        </dl>
        <hr />
        方案2
        <div id="divContext" runat="server">
            <div class="it-ec-textdiv"><p class="it-ec-paragraph"><span class="MD A1 can"> can</span><span class="VB A1 be"> be</span><span class="VVN A1 do"> done</span><span class="SENT UN .">.</span><span class="NN UN &amp;equo;"> "</span><span class="NP UN HIV"> HIV</span><span class="NP UN Community"> Community</span><span class="NP UN Nurse"> Nurse</span><span class=", UN ,">,</span><span class="NP UN Sue"> Sue</span><span class="NP UN Lore"> Lore</span><span class=", UN ,">,</span><span class="VVZ A1 take"> takes</span><span class="DT A1 an"> an</span><span class="NN A2 education"> education</span><span class="NN A1 class"> class</span><span class="IN A1 with"> with</span><span class="DT A1 the"> the</span><span class="NN A1 help"> help</span><span class="IN A1 of"> of</span><span class="NN UN patron"> patron</span><span class=", UN ,">,</span><span class="NP UN Cliff"> Cliff</span><span class="NP UN Patron"> Patron</span><span class="SENT UN .">.</span><span class="VVG A1 live"> Living</span><span class="IN A1 with"> with</span><span class="NP C2 AIDS"> AIDS</span><span class="IN A1 by"> by</span><span class="NP UN John"> John</span><span class="NP UN Creedy"> Creedy</span><span class="PP A1 you"> You</span><span class="MD A1 can"> can</span><span class="VB A1 be"> be</span><span class="RB B1 perfectly"> perfectly</span><span class="RB A1 well"> well</span><span class="IN A1 with"> with</span><span class="NP UN HIV"> HIV</span><span class="CC A1 and"> and</span><span class="IN A1 at"> at</span><span class="JJ A1 other"> other</span><span class="NNS A1 time"> times</span><span class="JJ B2 chronic"> chronic</span><span class="NN UN debility"> debility</span><span class="VVZ A1 make"> makes</span><span class="PP A1 it"> it</span><span class="JJ A1 hard"> hard</span><span class="TO A1 to"> to</span><span class="VV A1 do"> do</span><span class="RB A1 even"> even</span><span class="DT A1 the"> the</span><span class="JJ A2 basic"> basic</span><span class="NNS A1 thing"> things</span><span class="SENT UN .">.</span><span class="IN B1 in"> In</span><span class="DT A1 the"> the</span><span class="JJ A1 early"> early</span><span class="NNS A1 day"> days</span><span class="DT A1 the"> the</span><span class="NN C2 stigma"> stigma</span><span class="IN A1 of"> of</span><span class="VBG B1 being"> being</span><span class="NP UN HIV"> HIV</span><span class="NN B1 positive"> positive</span><span class="VHD A1 have"> had</span><span class="VVN A1 drive"> driven</span><span class="RB A1 away"> away</span><span class="RB A1 about"> about</span><span class="JJ UN 60&amp;percnt;"> 60%</span><span class="IN A1 of"> of</span><strong><span class="PP$ A1 my"> my</span></strong><span class="NN B1 circle"> circle</span><span class="IN A1 of"> of</span><span class="NNS A1 friend"> friends</span><span class="SENT UN .">.</span><span class="IN A1 despite"> Despite</span><span class="DT A1 the"> the</span><span class="NN B2 publicity"> publicity</span><span class="VVG A1 give"> giving</span><span class="DT A1 the"> the</span><span class="NNS A1 fact"> facts</span><span class="VVG B2 surround"> surrounding</span><span class="DT A1 the"> the</span><span class="NN C2 transmission"> transmission</span><span class="IN A1 of"> of</span><span class="DT A1 the"> the</span><span class="NN B1 disease"> disease</span><span class=", UN ,">,</span><span class="NN C1 ignorance"> ignorance</span><span class="VBD A1 be"> was</span><span class="JJ A1 such"> such</span><span class="IN A1 that"> that</span><span class="PP A1 they"> they</span><span class="VVD A2 become"> became</span><span class="JJ A2 afraid"> afraid</span><span class="IN A1 of"> of</span><span class="JJ A1 normal"> normal</span><span class="JJ B1 social"> social</span><span class="NN B1 contact"> contact</span><span class="SENT UN .">.</span><span class="PP A1 it"> It</span><span class="RB A1 soon"> soon</span><span class="VVD A2 become"> became</span><span class="JJ A1 clear"> clear</span><span class="IN A1 that"> that</span><span class="PP A1 I"> I</span><span class="MD A1 could"> could</span><span class="NN UN no_longer"> no longer</span><span class="VVP A2 rely"> rely</span><span class="IN A1 on"> on</span><span class="NNS A1 friend"> friends</span><span class="IN A1 for"> for</span><span class="NN A1 help"> help</span><span class="IN A1 with"> with</span><span class="JJ B1 everyday"> everyday</span><span class="NNS UN chore"> chores</span><span class="IN A1 like"> like</span><span class="NN A2 shopping"> shopping</span><span class="CC A1 and"> and</span><span class="NN UN housework"> housework</span><span class="WRB A1 when"> when</span><span class="PP A1 I"> I</span><span class="VVD A1 need"> needed</span><span class="PP A1 it"> it</span><span class="SENT UN .">.</span><span class="IN A1 while"> While</span><span class="VVG A1 decide"> deciding</span><span class="TO A1 to"> to</span><span class="VV A1 stay"> stay</span><span class="RB A1 as"> as</span><span class="JJ B1 independent"> independent</span><span class="IN A1 as"> as</span><span class="JJ A1 possible"> possible</span><span class=", UN ,">,</span><span class="PP A1 I"> I</span><span class="VVD B1 contact"> contacted</span><span class="NN UN ACET"> ACET</span><span class="WP A1 who"> who</span><span class="PP A1 I"> I</span><span class="VVD A1 know"> knew</span><span class="VVN B2 provided"> provided</span></p></div>    
        </div>
        <div id="divChart" runat="server">
            <table style="width:600px;">
            <tr>
                <th style="text-align:right;width:20px;">
                    UN:
                </th>
                <td style="width:20px;text-align:right;"> 28 </td>
                <td style="text-align:left;">
                    <div style="background-color:forestgreen;width: 20.0369%;color:white">&nbsp;</div>                  
                </td>
            </tr>
            <tr>
                <th style="text-align:right;" class="auto-style1">
                    A2:
                </th>
                <td style="text-align:right;" class="auto-style2"> 1 </td>
                <td style="text-align:left;" class="auto-style1">
                    <div style="background-color:orangered;width:0.715603%;color:white">&nbsp;</div>
                </td>
            </tr>
            <tr>
                <th style="text-align:right;">
                    A1:
                </th>
                <td style="width:20px;text-align:right;"> 2 </td>
                <td style="text-align:left;">
                    <div style="background-color:blue;width:1.43121%;color:white">&nbsp;</div>
                </td>
            </tr>
            <tr>
                <th>
                    B1:
                </th>
                <td style="width:20px;text-align:right;"> 77 </td>
                <td>
                    <div style="background-color:indigo; width: 55.1014%;color:white">&nbsp;</div>
                </td>
            </tr>
        </table>
        </div>
        
    </div>
    </form>
</body>
</html>
