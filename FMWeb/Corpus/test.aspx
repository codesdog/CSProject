<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="FMWeb.Corpus.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function numTxt_KeyDown(e, eventCtrl, flag, min, max) {
            var e = e ? e : window.event;//IE:event
            var keyCode = e.which ? e.which : e.keyCode; //IE KeyCode
            if (keyCode == 38) {
                //UP Arrow
                if (!isNaN(eventCtrl.value)) {
                    if (Number(eventCtrl.value) >= max) {
                        eventCtrl.value = max;
                    }
                    else {
                        eventCtrl.value = Number(eventCtrl.value) + flag;
                    }
                    return false;
                }
            }
            else if (keyCode == 40) {
                //DOWN Arrow
                if (!isNaN(eventCtrl.value)) {
                    if (Number(eventCtrl.value) <= min) {
                        eventCtrl.value = min;
                    }
                    else {
                        eventCtrl.value = Number(eventCtrl.value) - flag;
                    }
                }
                return false;
            }
        }

        function numTxt_KeyUp(e, eventCtrl, min, max) {
            var e = e ? e : window.event;//IE:event
            var keyCode = e.which ? e.which : e.keyCode;
            if (!isNaN(eventCtrl.value)) {
                if (Number(eventCtrl.value) >= max) {
                    eventCtrl.value = max;
                }
                else if (Number(eventCtrl.value) <= min) {
                    eventCtrl.value = min;
                }
                return false;
            }
        }
    </script>
    <asp:TextBox ID="tb1" runat="server" Text="123456.76" onkeydown="return numTxt_KeyDown(event,this,5,10,10000000);" />
    <asp:Button ID="btn" runat="server" Text="提交" />
    <asp:Button ID="btnUrl" runat="server" Text="Url" />
    <asp:Label ID="lbtxt" runat="server" Text=""></asp:Label>
    <br />
    <asp:TextBox ID="tb2" runat="server"></asp:TextBox>
    <asp:Button ID="btn2" runat="server" Text="检索" />
    <asp:GridView ID="gv2" runat="server"></asp:GridView>

    <script src="http://www.webdm.cn/themes/script/jquery.js"></script>

    <style>
        /*demo css*/

        .i_tips {
            height: 30px;
            margin-left: 20px;
            color: #f60;
            font-size: 14px;
            line-height: 30px
        }

        .i_box {
            margin: 10px 20px;
            font-size: 14px;
            float: left
        }

            .i_box * {
                vertical-align: middle
            }

            .i_box a {
                padding: 2px 5px;
                background-color: #e9e9e9;
                border: 1px solid #ccc;
                text-decoration: none;
                color: #585858;
                line-height: 20px
            }

                .i_box a:hover {
                    color: #000
                }

            .i_box input {
                width: 30px;
                height: 18px;
                margin: 0 8px;
                padding: 2px;
                border: 1px solid #ccc;
                text-align: center;
                line-height: 16px
            }
    </style>
    <script type="text/javascript">
        function checkAll(cblId) {
            for (var i = 0; i < document.getElementById(cblId).getElementsByTagName("input").length; i++) {
                document.getElementById(cblId + "_" + i).checked = true;
            }
        }

        function deleteAll(cblId) {
            for (var i = 0; i < document.getElementById(cblId).getElementsByTagName("input").length; i++) {
                document.getElementById(cblId+"_" + i).checked = false;
            }
        }

        function ReverseAll(cblId) {
            for (var i = 0; i < document.getElementById(cblId).getElementsByTagName("input").length; i++) {
                var objCheck = document.getElementById(cblId + "_" + i);
                if (objCheck.checked)
                    objCheck.checked = false;
                else
                    objCheck.checked = true;
            }
        }
        function checkOrNot(cblId, val) {
            for (var i = 0; i < document.getElementById(cblId).getElementsByTagName("input").length; i++) {
                document.getElementById(cblId + "_" + i).checked = val.checked;
            }
        }
    </script>
    <div class="qfld">
        <fieldset id="fdsLevel">
            <legend>Level 
                <input type="button" style="width: 60px; height: 20px; font-size: 12px;" onclick='checkAll("<%=cblLevel.ClientID%>")' value="All" />
                <input type="button" onclick='ReverseAll("<%=cblLevel.ClientID%>")' style="width: 40px; height: 20px; font-size: 12px;" value="Reverse" />
                <input type="button" onclick='deleteAll("<%=cblLevel.ClientID%>")' style="width: 40px; height: 20px; font-size: 12px;" value="None" />
                <input id="cbforLevel" type="checkbox" onchange='checkOrNot("<%=cblLevel.ClientID%>", this)' value="check All or None" />
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
            <legend><span style="font-weight:bold;font-size:15px;">Genre</span> 
                                <input type="button" style="width: 40px; height: 20px; font-size: 12px;" onclick='checkAll("<%=cblGenre.ClientID%>")' value="All" />
                <input type="button" onclick='ReverseAll("<%=cblGenre.ClientID%>")' style="width: 60px; height: 20px; font-size: 12px;" value="Reverse" />
                <input type="button" onclick='deleteAll("<%=cblGenre.ClientID%>")' style="width: 40px; height: 20px; font-size: 12px;" value="None" />
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
                                <input type="button" style="width: 40px; height: 20px; font-size: 12px;" onclick='checkAll("<%=cblTopic.ClientID%>")' value="All" />
                <input type="button" onclick='ReverseAll("<%=cblTopic.ClientID%>")' style="width: 60px; height: 20px; font-size: 12px;" value="Reverse" />
                <input type="button" onclick='deleteAll("<%=cblTopic.ClientID%>")' style="width: 40px; height: 20px; font-size: 12px;" value="None" />
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
    <div id="demo">

        <div class="i_tips"></div>

        <%--这个五个控件，用的时候可以根据具体要求增减--%>



        <div class="i_box">
            <a href="javascript:;" class="J_minus">-</a><input type="text" value="0" class="J_input" />
            <a href="javascript:;" class="J_add">+</a>
        </div>

        <div class="i_box">
            <a href="javascript:;" class="J_minus">-</a><input type="text" value="0" class="J_input" />
            <a href="javascript:;" class="J_add">+</a>
        </div>

        <div class="i_box">
            <a href="javascript:;" class="J_minus">-</a><input type="text" value="0" class="J_input" />
            <a href="javascript:;" class="J_add">+</a>
        </div>

        <div class="i_box">
            <a href="javascript:;" class="J_minus">-</a><input type="text" value="0" class="J_input" />
            <a href="javascript:;" class="J_add">+</a>
        </div>

        <div class="i_box">
            <a href="javascript:;" class="J_minus">-</a><input type="text" value="0" class="J_input" />
            <a href="javascript:;" class="J_add">+</a>
        </div>

    </div>
    <div class="i_box">
        <a href="javascript:;" class="J_minus">-</a>
        <input type="text" value="0" class="J_input" id="val1" runat="server" />
        <a href="javascript:;" class="J_add">+</a>
    </div>
    <script>
        $.fn.iVaryVal = function (iSet, CallBack) {

            /*

             * Minus:点击元素--减小
             * Add:点击元素--增加
             * Input:表单元素
             * Min:表单的最小值，非负整数
             * Max:表单的最大值，正整数
             */

            iSet = $.extend({
                Minus: $('.J_minus'),
                Add: $('.J_add'),
                Input: $('.J_input'),
                Min: 0,
                Max: 200000
            }, iSet);

            var C = null,
                O = null;

            //插件返回值

            var $CB = {};

            //增加

            iSet.Add.each(function (i) {
                $(this).click(function () {
                    O = parseInt(iSet.Input.eq(i).val());
                    (O + 1 <= iSet.Max) || (iSet.Max == null) ? iSet.Input.eq(i).val(O + 1) : iSet.Input.eq(i).val(iSet.Max);
                    //输出当前改变后的值
                    $CB.val = iSet.Input.eq(i).val();
                    $CB.index = i;
                    //回调函数
                    if (typeof CallBack == 'function') {
                        CallBack($CB.val, $CB.index);
                    }
                });
            });

            //减少

            iSet.Minus.each(function (i) {
                $(this).click(function () {
                    O = parseInt(iSet.Input.eq(i).val());
                    O - 1 < iSet.Min ? iSet.Input.eq(i).val(iSet.Min) : iSet.Input.eq(i).val(O - 1);
                    $CB.val = iSet.Input.eq(i).val();
                    $CB.index = i;
                    //回调函数
                    if (typeof CallBack == 'function') {
                        CallBack($CB.val, $CB.index);
                    }
                });
            });

            //手动
            iSet.Input.bind({
                'click': function () {
                    O = parseInt($(this).val());
                    $(this).select();
                },

                'keyup': function (e) {
                    if ($(this).val() != '') {
                        C = parseInt($(this).val());
                        //非负整数判断
                        if (/^[1-9]\d*|0$/.test(C)) {
                            $(this).val(C);
                            O = C;
                        } else {
                            $(this).val(O);
                        }
                    }

                    //键盘控制：上右--加，下左--减
                    if (e.keyCode == 38 || e.keyCode == 39) {
                        iSet.Add.eq(iSet.Input.index(this)).click();
                    }

                    if (e.keyCode == 37 || e.keyCode == 40) {
                        iSet.Minus.eq(iSet.Input.index(this)).click();
                    }

                    //输出当前改变后的值
                    $CB.val = $(this).val();
                    $CB.index = iSet.Input.index(this);
                    //回调函数
                    if (typeof CallBack == 'function') {
                        CallBack($CB.val, $CB.index);
                    }
                },

                'blur': function () {
                    $(this).trigger('keyup');
                    if ($(this).val() == '') {
                        $(this).val(O);
                    }

                    //判断输入值是否超出最大最小值
                    if (iSet.Max) {
                        if (O > iSet.Max) {
                            $(this).val(iSet.Max);
                        }
                    }

                    if (O < iSet.Min) {
                        $(this).val(iSet.Min);
                    }

                    //输出当前改变后的值
                    $CB.val = $(this).val();
                    $CB.index = iSet.Input.index(this);
                    //回调函数
                    if (typeof CallBack == 'function') {
                        CallBack($CB.val, $CB.index);
                    }
                }
            });
        }

        //调用
        $(function () {
            $('.i_box').iVaryVal({}, function (value, index) {
                //网页显示以下内容，可以隐藏掉
                $('.i_tips').html('你点击的表单索引是：' + index + '；改变后的表单值是：' + value);
            });
        });
    </script>
</asp:Content>
