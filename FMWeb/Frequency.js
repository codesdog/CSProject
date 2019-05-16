/*0123456789012345678901234567890123456789012345678901234567890123456789012345*/

var Frequency = FQ =
    {
        pdfHelpContext: "page=13",
        tabHeader: "Compare Frequencies",
        initialized: false,
        queryLines: [],
        qEDialogs: [],

        /* Combines new data with existing data and returns the   */
        /* combined set. The value setLabel is used to distinguis */
        /* columns with the same name.                            */
        combineData: function (existingData, newData, setLabel) {
            var combinedData = [];
            var newLine;
            var i;
            var key;
            for (i = 0; i < newData.length; i++) {
                newLine = existingData ? existingData[i] : {};
                for (key in newData[i]) {
                    if (newData[i].hasOwnProperty(key)) {
                        if (key === "corpus") {
                            if (!existingData) {
                                newLine.corpus = newData[i][key];
                            }
                        }
                        else {
                            newLine[key + setLabel] = newData[i][key];
                        }
                    }
                }
                combinedData[i] = newLine;
            }

            return combinedData;
        },

        getNthField: function (n) {
            return jQuery('.it-freq-row').filter('.' + n).find('.it-freq-field');
        },

        getNthQuery: function (n) {
            return FQ.getNthField(n).val();
        },

        setNthQuery: function (n, value) {
            FQ.getNthField(n).val(value);
        },

        /* Creates a HighChart to show the data */
        createHighChart: function (data) {
            var corpora = [];
            var ipm = [];
            var dataSeries = [];
            var titleText = "Comparison of frequency of ";
            var i, j;

            //    var colors = [0x006200, 0x8a0906, 0xad421b, 0xd38634, 0xfedd58];

            var colors = ['rgba(0, 98, 0, 0.75)',
                'rgba(138, 9, 6, 0.75)',
                'rgba(173, 66, 27, 0.75)',
                'rgba(211, 134, 52, 0.75)',
                'rgba(254, 221, 88, 0.75)'];

            var colorCounter = 0;

            for (j = 0; j < FQ.queryLines.length; j++) {
                ipm[j] = [];
                dataSeries.push({
                    name: FQ.getNthQuery(j),
                    data: ipm[j],
                    color: colors[j % 5]
                });
                titleText = titleText + FQ.getNthQuery(j)
                if (j < FQ.queryLines.length - 1) {
                    titleText = titleText + " and ";
                }
            }

            for (i = 0; i < data.length; i++) {
                corpora.push(data[i].corpus);
                for (j = 0; j < FQ.queryLines.length; j++) {
                    ipm[j].push(parseFloat(data[i]['ipm' + j]));
                }
            }

            var labelFormatter = function () {
                return this.name;
            };


            var highchartOptions = {
                chart: {
                    renderTo: 'frequencyComparisonChart',
                    defaultSeriesType: 'bar'
                },
                title: { text: titleText },
                xAxis: { categories: corpora },
                yAxis:
                {
                    min: 0,
                    title: { text: 'Instances per Million Words' }
                },
                tooltip: {
                    formatter: function () {
                        return this.series.name +
                            ': ' + this.y + ' instances per million';
                    }
                },
                plotOptions:
                {
                    bar:
                    {
                        dataLabels: { enabled: false },
                        borderWidth: 0,
                        shadow: false
                    }
                },
                legend:
                {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -100,
                    y: 100,
                    borderWidth: 1,
                    backgroundColor: '#FFFFFF',
                    labelFormatter: labelFormatter
                },
                series: dataSeries,
                credits: { enabled: false }
            };

            var chart = new Highcharts.Chart(highchartOptions);
            // We add a refreshData function to the chart because the YUI chart has one.
            chart.refreshData = function () { FQ.chart = FQ.createHighChart(FQ.actualData); };
            return chart;
        },

        /* Pops up a QueryEditor (formerly phraseSetup) for the given window. */
        popupQueryEditor: function (index) {
            var queryCallbackName = "setQuery" + index;
            var poppingDownCallbackName = "reEnable" + index;

            // We give 'this' (i.e. the frequency table window) a new attribute 
            // which is specific to the query window which this QueryEditor is
            // working for. The callback calls setQuery with the correct index
            window[queryCallbackName] =
                function (query) { FQ.setNthQuery(index, query); };

            window[poppingDownCallbackName] =
                function (query) {
                    jQuery("." + index + ' input').
                    utilitiesSetEnabled(true);;
                };

            // Note that the query has to be marmalized in case it contains (among 
            // other things) the CSAR type %

            // The dialogs have to have different NAMES (last argument) but once 
            // they're created JavaScript will just reload them if they're used again
            // (perhaps). 
            FQ.qEDialogs[index] =
                QueryEditor.createWindow(window,
                    (Language.current === 'll' ?
                        Parallel.getFromLanguage() : Language.current),
                    queryCallbackName,
                    poppingDownCallbackName,
                    Utilities.normalizeQuery(FQ.
                        getNthQuery(index)),
                    "FQSearchBuilderEditor" + index);

            // Disable the relevant features
            jQuery("." + index + ' input').utilitiesSetEnabled(false);

            return false;
        },

        /* Used as the callback in the json call which gets the data */
        tableCallback: function (data, aa) {
            var which = aa.which;

            Query.selectTab(4);

            FQ.actualData =
                FQ.combineData(FQ.actualData, data, which);

            Results.show('#frequencyComparisonTable', "Frequency Comparison");
            FQ.createYuiDataTable(FQ.actualData);

            Results.show('#frequencyComparisonChart', "Frequency Comparison");
            FQ.chart = FQ.createHighChart(FQ.actualData);

            if (FQ.queries.length > 0) {
                FQ.which++;
                FQ.submitQuery();
            }
            else {
                Utilities.endWaitWell();
            }
        },

        queries: [],
        colHeaders: [],

        /* Constructs the queue of FQ.queries and then starts the processing */
        constructQueryQueue: function () {
            jQuery('.it-freq-row').
                each(function () {
                    FQ.queries.
                    push(jQuery(this).find('.it-freq-field').val());
                });
        },

        constructArgs: function () {
            if (FQ.queries.length == 0) {
                FQ.actualData = null;
                FQ.colHeaders = [];
                FQ.constructQueryQueue();
                FQ.which = 0;
            }
            var query = FQ.queries.shift();
            FQ.colHeaders.push(query);
            var addressArgs =
            {
                q: Utilities.normalizeQuery(query),
                c: (jQuery("#allCorpora").is(":checked") ?
                    Corpora.getAll() : Corpora.getSelected()),
                registry: Corpora.getRegistry(),
                which: FQ.which
            };

            if (Translator.isConsistent(query, 'CQP')) {
                addressArgs.cqpsyntaxonly = 'on';
            }
            return addressArgs;
        },

        which: 0,

        /* Submits a query to the server */
        submitQuery: function () {

            var addressArgs = FQ.constructArgs();
            Utilities.startWait("Processing query ...");
            jQuery.getJSON(Utilities.constructJSONAddress('frequencyTable',
                addressArgs),
                function (data) {
                    FQ.tableCallback(data,
                        addressArgs);
                });
        },

        /* Specified as the handler to be called after column sorted events on the     */
        /* Datatable, sorts the actual data in the same ways as the Datatable's        */
        /* records have been sorted and then informs the chart of the change.          */
        columnSortedHandler: function (oArgs) {
            var records = this.getRecordSet().getRecords();
            var newData = [];
            var i;
            var j;
            for (i = 0; i < records.length; i++) {
                var corpus = records[i].getData("corpus");
                for (j = 0; j < FQ.actualData.length; j++) {
                    if (FQ.actualData[j].corpus === corpus) {
                        newData.push(FQ.actualData[j]);
                        break;
                    }
                }
            }

            FQ.actualData = newData;
            FQ.chart.refreshData();
        },

        /* Creates a YUI DataTable to represent the data which is expected to be an array of */
        /* objects.                                                                          */
        createYuiDataTable: function (data) {
            // Create an array of the keys in a data row because an array is easier to use below 
            var keys = [];
            var key;
            for (key in data[0]) {
                if (data[0].hasOwnProperty(key)) {
                    keys.push(key);
                }
            }

            /* The keys should consist of 'corpus' followed by pairs of 'instances' and 'ipm' (one pair for each query)  */
            /* Note that the fields actually have unique names ('instancesOne' etc.)                                     */
            /* We construct a nested header for this, each query has a 'Query' header and each of those has two children */
            /* one for 'instances' and one for 'ipm'. These are the same except that - the 'instances' column has an     */
            /* extra align-right class and the 'ipm' column specifies 3 decimal places in the number format.             */
            /* The fields for the dataSource responseSchema are be constructed in the same loop.                         */

            var colDefs = [];
            var fields = [];
            var counter = 1;
            var children;
            var columnLabel;
            var i;
            // Column definition for corpus column
            colDefs[0] = {
                key: "corpus",
                label: "Corpus",
                sortable: true,
                sortOptions: { sortFunction: FQ.rowSorter },
                resizeable: true
            };

            // Field definition for corpus field
            fields[0] = { key: "corpus" };

            // Start the key count after the corpus and go up in pairs
            for (i = 1; i < keys.length; i = i + 2) {
                // Field definitions for the next pair of 'instances' and 'ipm'
                fields[i] = { key: keys[i], parser: YAHOO.util.DataSource.parseNumber };
                fields[i + 1] = { key: keys[i + 1], parser: YAHOO.util.DataSource.parseNumber };

                // Column definitions for the next pair of 'instances' and 'ipm'
                children = [
                    {
                        key: keys[i],
                        label: "Instances",
                        formatter: YAHOO.widget.DataTable.formatNumber,
                        sortable: true,
                        sortOptions: { sortFunction: FQ.rowSorter },
                        className: "align-right",
                        resizeable: true
                    },
                    {
                        key: keys[i + 1],
                        label: "IPM",
                        formatter: YAHOO.widget.DataTable.formatNumber,
                        numberOptions: { decimalPlaces: 3 },
                        sortable: true,
                        sortOptions: { sortFunction: FQ.rowSorter },
                        resizeable: true
                    }
                ];

                // One overall column for each query. The columnLabel is either the query itself or 'Query n' with the 
                // query as tooltip depending on the length of the query (25 = Instances + IPM + abit).
                if (FQ.colHeaders[counter - 1].length > 25) {
                    columnLabel = '<span class="tooltip" title="' + FQ.colHeaders[counter - 1].replace(/\"/g, '&quot;') + '">Query ' + counter + '</span>';
                }
                else {
                    columnLabel = FQ.colHeaders[counter - 1];
                }
                colDefs[counter] = { label: columnLabel, children: children };

                counter++;
            }

            var dataSource = Utilities.createDataSource(data, fields);

            var table = new YAHOO.widget.DataTable("frequencyComparisonTable", colDefs, dataSource, { formatRow: FQ.rowFormatter });

            jQuery('#frequencyComparisonTable').parent().append($("<div></div>").
                css("position", "absolute").
                css("top", 0).css("right", 16).
                css('background-color', '#f5f5f5').
                css("background-image", 'url(../img/download.png)').
                css("height", 16).css("width", 16).css("cursor", "pointer").
                attr("title", "Click here to save table data to file").
                click(function () {
                    DownLoader.
                        getTableData(table);
                }));


            table.subscribe("columnSortEvent", FQ.columnSortedHandler);

            // Since we are using tooltip on newly created items (the column headers) we need to call its setup function again.
            tooltip();

            return table;
        },

        /* Used as the row formatter in the frequency Datatable, simply highlights the totals row */
        rowFormatter: function (elTr, oRecord) {
            if (oRecord.getData('corpus') === "Totals") {
                this.highlightRow(elTr);
            }
            return true;
        },

        /* Used as the row sorter in the frequency Datatable. */
        rowSorter: function (rowA, rowB, desc, field) {
            var rtrn;
            // The 'Totals' row must go at the bottom of the table. This means that 
            // it must always seem 'greater' whatever field we're sorting on and 
            // whether sorting is up or down. This in turn means that if 'rowA' is the 
            // 'Totals' row we have to return 1, if 'rowB' is the 'Totals' row we have
            //  to return -1.
            if (rowA.getData("corpus") === "Totals") {
                rtrn = 1;
            }
            else if (rowB.getData("corpus") === "Totals") {
                rtrn = -1;
            }
            // Otherwise we can return the value of the default sorter (because those 
            // fields which are numeric have parser YAHOO.util.DataSource.parseNumber 
            // specified as their parser when the table is created.
            else {
                rtrn = YAHOO.util.Sort.compare(rowA.getData(field),
                    rowB.getData(field), desc);
            }

            return rtrn;
        },

        createQueryLine: function (index) {
            var row = jQuery('<tr></tr>').
                addClass('it-freq-row').
                addClass('' + index);
            var field = Utilities.
                createItInputField('freqField ' + index,
                    80,
                    "Type a query (CQP or CSAR) here or use the Search Builder",
                    FQ.setButtons,
                    '#frequencySubmit');
            field.addClass('it-freq-field').
                appendTo(row).wrap('<td></td>');

            var sbButton = jQuery('<input type="button"></input>').
                attr('value', 'Search Builder').
                click(function () { FQ.popupQueryEditor(index); }).
                addClass('shortbutton');
            sbButton.appendTo(row).wrap('<td></td>');

            var deleteButton = jQuery('<input type="button"></input>').
                attr('value', 'Delete').
                click(function () { FQ.deleteQueryLine(index); }).
                addClass('shortbutton');
            deleteButton.appendTo(row).wrap('<td></td>');
            FQ.queryLines[index] = {
                dom: row,
                field: field,
                builderButton: sbButton,
                button: deleteButton
            };
            return row;
        },

        createChoices: function () {
            if (!FQ.initialized) {
                FQ.initialized = true;
                return jQuery('<div></div>').
                    css("position", "absolute").
                    css("height", "150px").
                    css("width", "90%").
                    attr('id', 'frequencySetupDiv').
                    append(jQuery('<div></div>').
                        append('<span>Search</span>').
                        append(jQuery('<input type="radio"/>').
                            attr('id', "allCorpora").
                            attr('name', "corpora").
                            attr('value', "ALL").
                            bind('change', function () { FQ.setButtons(); }).
                            attr('checked', "true")).
                        append('<label for="allCorpora"> all corpora </label>').
                        append(jQuery('<input type="radio"/>').
                            attr('id', "someCorpora").
                            attr('name', "corpora").
                            bind('change', function () { FQ.setButtons(); }).
                            attr('value', "SOME")).
                        append('<label for="someCorpora"> only selected corpora</label>').
                        css("position", "absolute").
                        css("top", "5px").
                        css("left", "5px")).
                    append(FQ.createTableDiv().
                        css("position", "absolute").
                        css("top", "40px").
                        css("left", "0").
                        css("overflow-y", "scroll").
                        css("height", "80px")).
                    append(FQ.createButtonsDiv().
                        css("position", "absolute").
                        css("top", "130px").
                        css("left", "0"));
            }
        },

        createTableDiv: function () {
            var tableDiv = jQuery('<div></div>');
            var queryTable = jQuery('<tbody id="queryTbody"></tbody>');
            queryTable.appendTo(tableDiv).wrap('<table></table>');
            queryTable.append(FQ.createQueryLine(FQ.howMany));
            FQ.howMany++;
            queryTable.append(FQ.createQueryLine(FQ.howMany));
            FQ.howMany++;

            return tableDiv;
        },

        createButtonsDiv: function () {
            return jQuery('<div></div>').
                append(jQuery('<input type="button"></input>').
                    attr('id', 'frequencyAdd').
                    addClass('shortbutton tooltip').
                    attr('value', 'Add').
                    click(function () { FQ.addQueryLine(); }).
                    css('position', 'absolute').
                    css('left', '0px')).
                append(jQuery('<input type="button"></input>').
                    attr("disabled", "true").
                    attr('id', 'frequencyDuplicate').
                    addClass('shortbutton tooltip').
                    attr('value', 'Duplicate').
                    click(function () { FQ.duplicateLastQueryLine(); }).
                    css('position', 'absolute').
                    css('left', '80px')).
                append(Utilities.createSubmitButton('frequencySubmit',
                    'Search',
                    'frequencyTable',
                    FQ.constructArgs,
                    FQ.tableCallback).
                    css('position', 'absolute').
                    css('top', '30px').
                    css('left', '0px'));
        },

        howMany: 0,

        deleteQueryLine: function (index) {
            jQuery(FQ.queryLines.splice(index, 1)[0].dom).remove();
            FQ.howMany = FQ.queryLines.length;
            FQ.setButtons();
        },

        addQueryLine: function () {
            jQuery("#queryTbody").append(FQ.createQueryLine(FQ.howMany));
            FQ.howMany++;
            FQ.setButtons();
        },

        duplicateLastQueryLine: function () {
            var value;

            // The setButtons function makes the button available in only two 
            // circumstances so we need less ifelsing here than you might expect.
            // If the last query is  valid we're duplicating it in a new query
            value = FQ.getNthQuery(FQ.howMany - 1);
            if (Translator.isSyntaxCorrect(value)) {
                FQ.addQueryLine();
            }
            // otherwise we're duplicating the value of the first query into the
            // existing last one.
            else {
                value = FQ.getNthQuery(0);
            }
            // set the value of the last one 
            FQ.setNthQuery(FQ.howMany - 1, value);

            FQ.setButtons();
        },

        setButtons: function () {
            if (FQ.initialized) {
                var i;
                var value;

                // The duplicate button is available if a) there are two queries 
                // and the first is valid AND THE SECOND ONE ISN'T or b) the last 
                // query is valid. 

                // This is the validity of the last query.
                value = Translator.
                    isSyntaxCorrect(jQuery(FQ.
                        queryLines[FQ.howMany - 1].
                        field).attr("value"));

                // If it's invalid but there are two queries then try the validity
                // of the first one.
                if (!value && FQ.howMany === 2) {
                    value = Translator.
                        isSyntaxCorrect(jQuery(FQ.
                            queryLines[0].
                            field).attr("value"));
                }

                jQuery("#frequencyDuplicate").
                    utilitiesSetEnabled(value);

                // The submit button is available if corpora exists and all
                // queries are valid
                var enabled = jQuery('#allCorpora').is(':checked') ||
                    Corpora.getSelected().length > 0;

                for (i = 0; i < FQ.howMany; i++) {
                    value = jQuery(FQ.queryLines[i].field).attr("value");
                    jQuery(FQ.queryLines[i].builderButton).
                        utilitiesSetEnabled(value.length === 0 ||
                            Translator.isSyntaxCorrect(value));
                    enabled &= Translator.isSyntaxCorrect(value);
                }

                jQuery('#frequencySubmit').utilitiesSetEnabled(enabled);

                // The delete button of a solo query is not available
                if (FQ.howMany === 1) {
                    jQuery(FQ.queryLines[0].button).
                        utilitiesSetEnabled(false);
                }
                else {
                    for (i = 0; i < FQ.howMany; i++) {
                        jQuery(FQ.queryLines[i].button).
                            utilitiesSetEnabled(true);
                    }

                }
            }
        },

        createResultsDivs: function () {
            Results.createResultDiv('Frequency Comparison Table', null);
            Results.createResultDiv('Frequency Comparison Chart', null);
        }
    };

