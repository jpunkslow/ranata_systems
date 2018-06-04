<div id="sidebar" class="box-content ani-width">
    <div id="sidebar-scroll">
        <ul class="" id="sidebar-menu">
            <?php
            
            $sidebar_menu[] = array("name" => "Dashboard","slug"=>"dashboard", "url" => "dashboard", "class" => "fa-desktop");
            
            $jurnal_submenu = array();
            $jurnal_submenu[] = array("name" => "Expenses Cash", "slug"=>"expenses","url" => "accounting/expenses");
            $jurnal_submenu[] = array("name" => "Income Cash", "slug"=>"income","url" => "accounting/income");


            $sidebar_menu[] = array("name" => "Input Journal Cash", "slug"=>"","url" => "#", "class" => "fa-desktop", "submenu" => $jurnal_submenu);

            $ar_submenu = array();
            $ar_submenu[] = array("name" => "Sales Quotation", "slug"=>"quotation","url" => "sales/quotation");
            $ar_submenu[] = array("name" => "Sales Order", "slug"=>"order","url" => "sales/order");
            $ar_submenu[] = array("name" => "Sales Invoice","slug"=>"s_invoices", "url" => "sales/s_invoices");
            $ar_submenu[] = array("name" => "Sales Receipts", "slug"=>"s_payments","url" => "sales/s_payments");

            $sidebar_menu[] = array("name" => "Input AR", "slug"=>"#","url" => "#", "class" => "fa-desktop","submenu" => $ar_submenu);
            
            $ap_submenu = array();
            $ap_submenu[] = array("name" => "Purchase Requisition","slug"=>"request", "url" => "purchase/request");
            $ap_submenu[] = array("name" => "Purchase Order", "slug"=>"p_order","url" => "purchase/p_order");
            $ap_submenu[] = array("name" => "Purchase Invoice", "slug"=>"p_invoices","url" => "purchase/p_invoices");
            $ap_submenu[] = array("name" => "Purchase Payment", "slug"=>"p_payments","url" => "purchase/p_payments");
            

            $sidebar_menu[] = array("name" => "Input AP","slug"=>"#", "url" => "#", "class" => "fa-desktop", "submenu" => $ap_submenu);
            
            $acc_submenu = array();
            $acc_submenu[] = array("name" => "Edit Journal Entry", "slug"=>"journal_entry","url" => "accounting/journal_entry");
            $acc_submenu[] = array("name" => "General Ledger", "slug"=>"general_ledger","url" => "accounting/general_ledger");
            $acc_submenu[] = array("name" => "Trial Balance", "slug"=>"neraca","url" => "accounting/neraca");

            $sidebar_menu[] = array("name" => "Accounting","slug"=>"accounting", "url" => "#", "class" => "fa-desktop", "submenu" => $acc_submenu);

            $rpt_submenu = array();
            $rpt_submenu[] = array("name" => "Profit and Loss", "slug"=>"laba_rugi","url" => "reports/laba_rugi");
            $rpt_submenu[] = array("name" => "Profit and Loss Total", "slug"=>"bukubesar","url" => "master/bukubesar");
            $rpt_submenu[] = array("name" => "Profit and Loss Project", "slug"=>"laba_rugi","url" => "reports/laba_rugi");
            
            $rpt_submenu[] = array("name" => "Balance Sheet","slug"=>"r_receivable", "url" => "master/coa");
            $rpt_submenu[] = array("name" => "Aging Receivable Detail Piutang", "slug"=>"r_payable","url" => "master/coa");
            $rpt_submenu[] = array("name" => "Aging Payable Detail", "slug"=>"r_sales","url" => "master/coa");
            $rpt_submenu[] = array("name" => "Sales Reports", "slug"=>"r_cashflow","url" => "master/coa");
            $rpt_submenu[] = array("name" => "Cash Flow Reports", "slug"=>"r_cashflow","url" => "master/coa");


            $sidebar_menu[] = array("name" => "Reports", "slug"=>"#","url" => "#", "class" => "fa-desktop", "submenu" => $rpt_submenu);
            // MENU DATA MASTER INPUT
            $master_submenu = array();
            $master_submenu[] = array("name" => "Chart Of Account", "slug"=>"coa","url" => "master/coa");
            $master_submenu[] = array("name" => "COA Balance", "slug"=>"saldoawal","url" => "master/saldoawal");
            $master_submenu[] = array("name" => "Customers", "slug"=>"customers","url" => "master/customers");
            $master_submenu[] = array("name" => "Vendors", "slug"=>"vendors","url" => "master/vendors");
            $master_submenu[] = array("name" => "Items or Products", "slug"=>"items","url" => "master/items");
            $master_submenu[] = array("name" => "Fixed Assets", "slug"=>"assets","url" => "master/assets");
            $master_submenu[] = array("name" => "Projects", "slug"=>"projects","url" => "master/projects");
            // $master_submenu[] = array("name" => "payable", "url" => "accounting/payable");

            $sidebar_menu[] = array("name" => "Input Master", "slug"=>"","url" => "#", "class" => "fa-list", "submenu" => $master_submenu);
            // ----- END MENU MASTER

            $sidebar_menu[] = array("name" => "Settings", "slug"=>"settings","url" => "settings/general", "class" => "fa-wrench");

            foreach ($sidebar_menu as $main_menu) {
                $submenu = get_array_value($main_menu, "submenu");
                $expend_class = $submenu ? " expand " : "";
                $active_class = active_menu($main_menu["slug"], $submenu);
                $submenu_open_class = "";
                if ($expend_class && $active_class) {
                    $submenu_open_class = " open ";
                }

                $devider_class = get_array_value($main_menu, "devider") ? "devider" : "";
                $badge = get_array_value($main_menu, "badge");
                $badge_class = get_array_value($main_menu, "badge_class");
                ?>
                <li class="<?php echo $active_class . " " . $expend_class . " " . $submenu_open_class . " $devider_class"; ?> main">
                    <a href="<?php echo_uri($main_menu['url']); ?>">
                        <i class="fa <?php echo ($main_menu['class']); ?>"></i>
                        <span><?php echo $main_menu['name']; ?></span>
                        <?php
                        if ($badge) {
                            echo "<span class='badge $badge_class'>$badge</span>";
                        }
                        ?>
                    </a>
                    <?php
                    if ($submenu) {
                        echo "<ul>";
                        foreach ($submenu as $s_menu) {
                            ?>
                        <li>
                            <a href="<?php echo_uri($s_menu['url']); ?>">
                                <i class="dot fa fa-circle"></i>
                                <span><?php echo $s_menu['name']; ?></span>
                            </a>
                        </li>
                        <?php
                    }
                    echo "</ul>";
                }
                ?>
                </li>
            <?php } ?>
        </ul>
    </div>
</div><!-- sidebar menu end -->