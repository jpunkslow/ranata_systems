<script type="text/javascript">
    AppHelper = {};
    AppHelper.baseUrl = "<?php echo base_url(); ?>";
    AppHelper.assetsDirectory = "<?php echo base_url("assets") . "/"; ?>";
    AppHelper.settings = {};
    AppHelper.settings.firstDayOfWeek =<?php echo get_setting("first_day_of_week") * 1; ?> || 0;
    AppHelper.settings.currencySymbol = "<?php echo get_setting("currency_symbol"); ?>";
    AppHelper.settings.currencyPosition = "<?php echo get_setting("currency_position"); ?>" || "left";
    AppHelper.settings.decimalSeparator = "<?php echo get_setting("decimal_separator"); ?>";
    AppHelper.settings.thousandSeparator = "<?php echo get_setting("thousand_separator"); ?>";
    AppHelper.settings.displayLength = "<?php echo get_setting("rows_per_page"); ?>";
    AppHelper.settings.timeFormat = "<?php echo get_setting("time_format"); ?>";
    AppHelper.settings.scrollbar = "<?php echo get_setting("scrollbar"); ?>";
  
</script>