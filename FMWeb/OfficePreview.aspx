<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OfficePreview.aspx.cs" Inherits="FMWeb.OfficePreview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="js/swfPreview/jquery.js" type="text/javascript"></script>
    <script src="js/swfPreview/flexpaper_flash_debug.js" type="text/javascript"></script>
    <script src="js/swfPreview/flexpaper_flash.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var winWidth = 0;
            var winHeight = 0;
            function findDimensions() //函数：获取尺寸 
            {
                ////获取窗口宽度 
                //if (window.innerWidth)
                //    winWidth = window.innerWidth;
                //else if ((document.body) && (document.body.clientWidth))
                //    winWidth = document.body.clientWidth;

                //获取窗口高度 
                if (window.innerHeight)
                    winHeight = window.innerHeight;
                else if ((document.body) && (document.body.clientHeight))
                    winHeight = document.body.clientHeight;
                //通过深入Document内部对body进行检测，获取窗口大小 && document.documentElement.clientWidth
                if (document.documentElement && document.documentElement.clientHeight) {
                    winHeight = document.documentElement.clientHeight;
                    //winWidth = document.documentElement.clientWidth;
                }
                //高度
                $("#viewerPlaceHolder").height(winHeight);
            }
            findDimensions();
            //调用函数，获取数值 
            window.onresize = findDimensions;
        })
    </script>
    <style type="text/css">
        body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-bottom: 0px;
            margin-right: 0px;
            height: 100%;
        }

        #div1
        {
            margin: 0px auto;
            /*border: 0px solid #0094ff;*/
            width: 100%;
            height: 100%;
        }

        #viewerPlaceHolder
        {
            /*height: 598px;*/
        }
    </style>
     <div id="center">
        <a id="viewerPlaceHolder" style="display: block;"></a>
        <script type="text/javascript">
            $(function () {
                $("#pageloading").show();
                var fp = new FlexPaperViewer(
                    'js/swfPreview/FlexPaperViewer',
                    'viewerPlaceHolder',
                    {
                        config: {
                            SwfFile: escape('TargetFile/Swf/swf.swf'),//这里是要显示的swf的位置，相对根目录
                            Scale: 1,//缩放比例
                            ZoomTransition: 'easeOut',//Flexpaper中缩放样式，它使用和Tweener一样的样式，默认参数值为easeOut.其他可选值包括: easenone, easeout, linear, easeoutquad
                            ZoomTime: 0.5,//从一个缩放比例变为另外一个缩放比例需要花费的时间，该参数值应该为0或更大。
                            ZoomInterval: 0.2,//缩放比例之间间隔，默认值为0.1，该值为正数。
                            FitPageOnLoad: false,//初始化的时候自适应页面，与使用工具栏上的适应页面按钮同样的效果。
                            FitWidthOnLoad: false,//初始化的时候自适应页面宽度，与工具栏上的适应宽度按钮同样的效果。
                            PrintEnabled: false,//是否支持打印
                            FullScreenAsMaxWindow: false,//是否支持打印
                            ProgressiveLoading: false,//当设置为true的时候，展示文档时不会加载完整个文档，而是逐步加载，但是需要将文档转化为9以上的flash版本（使用pdf2swf的时候使用-T 9 标签）。
                            MinZoomSize: 0.2,//最小的缩放比例。
                            MaxZoomSize: 5,//设置最大的缩放比例。
                            SearchMatchAll: false,//设置为true的时候，单击搜索所有符合条件的地方高亮显示。
                            InitViewMode: 'TwoPage',//启动模式，如”Portrait” or “TwoPage”.
                            ViewModeToolsVisible: false,//工具栏上是否显示样式选择框(就是显示缩略图或分页显示的工具)
                            ZoomToolsVisible: true,//工具栏上是否显示缩放工具
                            NavToolsVisible: false,//工具栏上是否显示导航工具(也就是页码工具)
                            CursorToolsVisible: true,//工具栏上是否显示光标工具
                            SearchToolsVisible: true,//工具栏上是否显示搜索
                            localeChain: 'zh_CN'//语言
                        }
                    }
                );
                $("#pageloading").fadeOut(1000);
            });
        </script>
    </div>
    <div id="pageloading" style="background-color: White; width: 100%; height: 100%; position: fixed; top: 0; left: 0; display: none; text-align: center; margin: 0px auto; vertical-align: middle; z-index: 999">
        <img src="/images/loading.gif" style="width: 48px; height: 48px; position: fixed; top: 45%; left: 45%; right: 50%; bottom: 50%;" />
    </div>
    <div id="txtPreview" style="width: 100%; height: 100%; top: 0; left: 0;">
        <pre id="pre"></pre>
    </div>
</asp:Content>
