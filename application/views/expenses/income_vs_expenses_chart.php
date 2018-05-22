<div id="page-content" class="clearfix p20">
    <div class="panel clearfix">
        <ul data-toggle="ajax-tab" class="nav nav-tabs bg-white inner p10" role="tablist">
            <li class="title-tab"><h4 class="pl10"><?php echo lang("income_vs_expenses"); ?></h4></li>
            <div class="pull-right pr10">
                <div id="yearly-chart-date-range-selector">
                </div>
            </div>
        </ul>

        <div class="tab-content p15">
            <div id="income-vs-expenses-chart" style="width: 100%; height: 350px;"></div>
        </div>
    </div>
</div>

<?php
load_js(array(
    "assets/js/flot/jquery.flot.min.js",
    "assets/js/flot/jquery.flot.resize.min.js",
    "assets/js/flot/jquery.flot.tooltip.min.js",
    "assets/js/flot/curvedLines.js",
));
?>

<script type="text/javascript">
    var initIncomeExpenseChart = function (income, expense) {
        var dataset = [
            {
                data: income,
                color: "rgba(0, 179, 147, 1)",
                lines: {
                    show: true,
                    fill: 0.2
                },
                points: {
                    show: false
                },
                shadowSize: 0
            },
            {
                label: "<?php echo lang('income'); ?>",
                data: income,
                color: "rgba(0, 179, 147, 1)",
                lines: {
                    show: false
                },
                points: {
                    show: true,
                    fill: true,
                    radius: 4,
                    fillColor: "#fff",
                    lineWidth: 1
                },
                shadowSize: 0,
                curvedLines: {
                    apply: false
                }
            },
            {
                data: expense,
                color: "#F06C71",
                lines: {
                    show: true,
                    fill: 0.2
                },
                points: {
                    show: false
                },
                shadowSize: 0
            },
            {
                label: "<?php echo lang('expense'); ?>",
                data: expense,
                color: "#F06C71",
                lines: {
                    show: false
                },
                points: {
                    show: true,
                    fill: true,
                    radius: 4,
                    fillColor: "#fff",
                    lineWidth: 1
                },
                shadowSize: 0,
                curvedLines: {
                    apply: false
                }
            }

        ];
        $.plot("#income-vs-expenses-chart", dataset, {
            series: {
                curvedLines: {
                    apply: true,
                    active: true,
                    monotonicFit: true
                }
            },
            legend: {
                show: true
            },
            yaxis: {
                min: 0
            },
            xaxis: {
                ticks: [[1, "<?php echo lang('short_january'); ?>"], [2, "<?php echo lang('short_february'); ?>"], [3, "<?php echo lang('short_march'); ?>"], [4, "<?php echo lang('short_april'); ?>"], [5, "<?php echo lang('short_may'); ?>"], [6, "<?php echo lang('short_june'); ?>"], [7, "<?php echo lang('short_july'); ?>"], [8, "<?php echo lang('short_august'); ?>"], [9, "<?php echo lang('short_september'); ?>"], [10, "<?php echo lang('short_october'); ?>"], [11, "<?php echo lang('short_november'); ?>"], [12, "<?php echo lang('short_december'); ?>"]]
            },
            grid: {
                color: "#bbb",
                hoverable: true,
                borderWidth: 0,
                backgroundColor: '#FFF'
            },
            tooltip: {
                show: true,
                content: function (x, y, z) {
                    if (x) {
                        return "%s: " + toCurrency(z);
                    } else {
                        return false;
                    }
                },
                defaultTheme: false
            }
        });
    };
    var prepareExpensesFlotChart = function (data) {
        appLoader.show();
        $.ajax({
            url: "<?php echo_uri("expenses/income_vs_expenses_chart_data") ?>",
            data: data,
            cache: false,
            type: 'POST',
            dataType: "json",
            success: function (response) {
                appLoader.hide();
                initIncomeExpenseChart(response.income, response.expenses);
            }
        });
    };
    $(document).ready(function () {

        $("#yearly-chart-date-range-selector").appDateRange({
            dateRangeType: "yearly",
            onChange: function (dateRange) {
                prepareExpensesFlotChart(dateRange);
            },
            onInit: function (dateRange) {
                prepareExpensesFlotChart(dateRange);
            }
        });
    });
</script>
