function getUser(obj) {
    var name = $(obj).text();
    var userid = $(obj).attr("userid");
    var attrUser = new Array();
    //alert($("#user1").find("span").length); 
    if ($("#user1").find("span").length > 0) {
        $("#user1").find("span").each(function (i) {
            // alert($(this).attr('userid')); 
            attrUser[i] = $(this).attr('userid');
        })
        if ($.inArray(userid, attrUser) == -1) {
            $('#user1').append('<span  class="label label-primary" style="display: inline-block;height:20px;font-size:14px;" userid="' + userid + '">' + name + '</span>' + ' ');
        }
    } else {
        $('#user1').append('<span  class="label label-primary" style="display: inline-block;height:20px;font-size:14px;" userid="' + userid + '">' + name + '</span>' + ' ');
    }
}



function spanClickDetail() {

    $("#divContext").find('span').each(function (index) {
        $(this).click(function () {
            // to do something
            // index计数
        });

    });
}




var EC = ExtendedContext = {

    // cb is a circular buffer used to keep track of the dialogs. The
    // reuse function is set to allow closed dialogs to be reused.
    cb: new CircularBuffer(function () { return EC.createNewDialog(); },
        function (d) { return !jQuery(d).dialog("isOpen"); },
        3),

    // Gets a dialog from the CircularBuffer and opens it.
    getADialog: function () {
        return jQuery(EC.cb.next()).dialog("open");
    },

    contextSize: 70,

    // Creates a new dialog. This is passed to the CircularBuffer as its
    // create function.
    createNewDialog: function () {
        // NB in the button click callbacks 'this' will be our first div not
        // (as you might infer from a quick reading of the jQueryUI docs) the
        // thing that jQuery wraps around it.
        var dialog = jQuery('<div></div>').attr('id', 'wtf').
            append(jQuery('<div></div>').addClass('it-ec-textdiv')).
            append(jQuery('<div></div>').addClass('it-ec-statsdiv')).
            append(jQuery('<div></div>').
                addClass('it-ec-document').
                addClass('cts-red').
                append(jQuery('<div></div>').
                    addClass('it-ec-extract').
                    addClass('cts-yellow'))).
            appendTo('body').
            dialog({
                dialogClass: 'it-ec-dialog',
                minWidth: 850,
                minHeight: 400,
                buttons: [
                    {
                        text: "Extend <",
                        'class': 'it-button',
                        click: function (ev) { EC.extend(this, 4); }
                    },
                    {
                        text: "Move <",
                        'class': 'it-button',
                        click: function (ev) { EC.move(this, -1); }
                    },
                    {
                        text: "Reset",
                        'class': 'it-button',
                        click: function (ev) { EC.reset(this); }
                    },
                    {
                        text: "Move >",
                        'class': 'it-button',
                        click: function (ev) { EC.move(this, 1); }
                    },
                    {
                        text: "Extend >",
                        'class': 'it-button',
                        click: function (ev) { EC.extend(this, 5); }
                    },
                    {
                        text: "Close",
                        'class': 'it-button',
                        click: function () { jQuery(this).dialog('close'); }
                    }
                ]
            });

        return dialog;
    },

    move: function (dialog, direction) {
        var lp = jQuery(dialog).data("lastParams");
        var previous = parseInt(lp[0].substr(lp[0].lastIndexOf("\.") + 1));
        var next = previous + direction * EC.contextSize;
        lp[0] = lp[0].replace(/\.[^.]*/g, "\." + next);
        EC.extendData(dialog, lp);
    },

    extend: function (dialog, direction) {
        var lp = jQuery(dialog).data("lastParams");
        lp[direction] = '' + (parseInt(lp[direction]) + EC.contextSize);
        EC.extendData(dialog, lp);
    },

    reset: function (dialog) {
        EC.extendData(dialog, jQuery(dialog).data("originalParams"));
    },

    extendData: function (dialog, params) {
        jQuery.
            getJSON(Utilities.constructJSONAddress('showcontext',
                {
                    cpos: params[0],
                    registry: params[1],
                    kellyLang: params[2],
                    kelly: params[3],
                    lw: params[4],
                    rw: params[5]
                }),
                function (data) { EC.setData(dialog, data); });
    },

    setData: function (dialog, data) {
        if (!jQuery(dialog).data("originalParams")) {
            // Note that we have to copy the params (using a traditional
            // JavaScript trick) otherwise we fall for one of JavaScripts
            // well known cons - reference or value - it depends.
            jQuery(dialog).data("originalParams", data.params.slice(0));
        }
        jQuery(dialog).data("lastParams", data.params);
        var regex = /id=\"(.*?)\"/g;
        var result = regex.exec(data.title);
        regex.lastIndex = 0;
        var title = (result !== null ? result[1] : "unknown");
        var corpus = data.params[0].replace(/\..*/, "");
        if (Keywords.keyLemmaCache[corpus]) {
            EC.tagKeyLemmas(data, Keywords.keyLemmaCache[corpus]);
        }
        EC.setText(dialog, data.title, data.left, data.match, data.right);
        EC.setTitle(dialog, title);
        EC.setWidthIndicator(dialog, data.params, data.limits);
        KW.setHighlights();
        if (data.stats) {
            jQuery(dialog).
                children('.it-ec-statsdiv').
                empty().
                append(Keywords.createStatsGraph(data.stats));
            jQuery('.it-ec-statsdiv').find('.it-chart-dd, .it-chart-dt').
                click(function () {
                    var toToggle = "." + jQuery(this).data('label');
                    Debug.outLine("CLICKED " + toToggle);
                    //		    jQuery(toToggle).toggleClass('highlight');
                    // For consistency we toggle the button on the Keywords pull
                    // out window rather than toggling the class directly. 
                    jQuery('.highlightToggle').
                        filter('[value="' + toToggle + '"]').
                        each(function () {
                            var c = jQuery(this).attr('checked');
                            jQuery(this).attr('checked', !c).trigger('change');
                        });
                });
        }
    },

    removeData: function (dialog) {
        // NB NEVER call removeData without arguments - jQuery uses data 
        // for its own purposes and removing all data causes disaster.
        jQuery(dialog).removeData('originalParams').removeData('lastParams');
    },

    setWidthIndicator: function (dialog, params, limits) {
        var cpos = parseInt(params[0].substr(params[0].lastIndexOf("\.") + 1));
        var left = (cpos - parseInt(params[4]) - parseInt(limits[1])) /
            (parseInt(limits[2]) - parseInt(limits[1]));
        var width = (parseInt(params[4]) + parseInt(params[5]) + 1) /
            (parseInt(limits[2]) - parseInt(limits[1]));
        left = '' + left * 100.0 + '%';
        width = '' + width * 100.0 + '%'
        jQuery(dialog).find('.it-ec-extract').
            css('left', left).
            css('width', width);
    },

    setText: function (dialog, title, left, match, right) {
        jQuery(dialog).
            find('.it-ec-textdiv').
            empty().
            append('<p class="it-ec-paragraph">' + '<strong>' + title +
                '</strong><br>' +
                left +
                '<strong>' + match +
                '</strong>' +
                right + '</p>');

        jQuery('.it-ec-paragraph span').
            mouseenter(function (ev) {
                Grammar.showExplanation(this);
            });
    },

    setTitle: function (dialog, title) {
        jQuery(dialog).dialog("option", "title", title);
    },

    // This is the only function needed outside the file, it takes a cpos
    // (in full cqp form e.g. BNC.123.123) and does all that is needed to
    // display it in an EC dialog.
    display: function (cpos, extraOptions) {
        var defaultOptions = {
            cpos: cpos,
            registry: Corpora.getRegistry(),
            kellyLang: Language.current,
            kelly: 'on',
            lw: EC.contextSize,
            rw: EC.contextSize
        };
        var options = defaultOptions;
        if (extraOptions) {
            options = jQuery.extend({}, defaultOptions, extraOptions);
        }
        jQuery.getJSON(Utilities.
            constructJSONAddress('showcontext',
                options
            ),
            function (data) {
                var d = EC.createNewDialog();
                EC.removeData(d);
                EC.setData(d, data);
            });
    },
    displayCdoc: function (cdoc) {
        jQuery.getJSON(Utilities.
            constructJSONAddress('showcontext',
                {
                    cdoc: cdoc,
                    registry: Corpora.getRegistry(),
                    kellyLang: Language.current,
                    kelly: 'on',
                    lw: 0,
                    rw: 2 * EC.contextSize
                }),
            function (data) {
                var d = EC.createNewDialog();
                EC.removeData(d);
                EC.setData(d, data);
            });
    },

    tagKeyLemmas: function (data, lemmas) {
        var lemma;
        var re;
        var rout;
        // BFI first, last, always
        for (var i = 0; i < lemmas.length; i++) {
            lemma = lemmas[i][0];
            rin = new RegExp(' ' + lemma + '\'\>', 'g');
            rout = ' KW ' + lemma + "'>"
            data.left = data.left.replace(rin, rout);
            data.match = data.match.replace(rin, rout);
            data.right = data.right.replace(rin, rout);
        }
    }
}