    <br>
    <h5>Payments & Invoices</h5>
<hr>
<div class="box">
    <div class="box-content widget-container b-r">
        <div class="panel-body panel-sky">
            <h1 class=""><?php echo $total; ?></h1>
            <span class="text-off uppercase">Payment Total</span>
        </div>
    </div>
    <div class="box-content widget-container ">
        <div class="panel-body ">
            <h2><?php echo to_currency($total_amount,false); ?></h2>
            <span class="text-off uppercase">Payment Total IDR</span>
        </div>
    </div>
</div>
<div class="box">
    <div class="box-content widget-container b-r">
        <div class="panel-body panel-success">
            <h1 class=""><?php echo $inv_total; ?></h1>
            <span class="text-off uppercase">Invoices Total</span>
        </div>
    </div>
    <div class="box-content widget-container ">
        <div class="panel-body">
            <h2><?php echo to_currency($inv_total_amount,false); ?></h2>
            <span class="text-off uppercase">Invoices Total IDR</span>
        </div>
    </div>
</div>