<div id="sidebar" class="box-content ani-width">
    <div id="sidebar-scroll">
        <ul class="" id="sidebar-menu">
            <?php
            $user_type = $this->login_user->user_type;
            $is_admin   = $this->login_user->is_admin;
            $sidebar_menu[] = array("name" => "Dashboard","slug"=>"dashboard", "url" => "dashboard", "class" => "fa-dashboard");
            
            $jurnal_submenu = array();

            $jurnal_submenu[] = array("name" => "Expense", "slug"=>"expenses","url" => "accounting/expenses");
            $jurnal_submenu[] = array("name" => "Income", "slug"=>"income","url" => "accounting/income");

            if($user_type == 'sales' || $is_admin || $user_type == 'admin' || $user_type == 'manager' || $user_type == 'finance'){
                $sidebar_menu[] = array("name" => "Input Journal", "slug"=>"","url" => "#", "class" => "fa-money", "submenu" => $jurnal_submenu);

            

                $ar_submenu = array();
                $ar_submenu[] = array("name" => "Sales Quotation", "slug"=>"quotation","url" => "sales/quotation");
                $ar_submenu[] = array("name" => "Sales Order", "slug"=>"order","url" => "sales/order");
                $ar_submenu[] = array("name" => "Sales Invoice","slug"=>"s_invoices", "url" => "sales/s_invoices");
                $ar_submenu[] = array("name" => "Sales Receipts", "slug"=>"s_payments","url" => "sales/s_payments");

                $sidebar_menu[] = array("name" => "Sales", "slug"=>"#","url" => "#", "class" => "fa-dollar","submenu" => $ar_submenu);
                
                $ap_submenu = array();
                $ap_submenu[] = array("name" => "Purchase Quotation","slug"=>"request", "url" => "purchase/request");
                $ap_submenu[] = array("name" => "Purchase Order", "slug"=>"p_order","url" => "purchase/p_order");
                $ap_submenu[] = array("name" => "Purchase Invoice", "slug"=>"p_invoices","url" => "purchase/p_invoices");
                $ap_submenu[] = array("name" => "Purchase Payment", "slug"=>"p_payments","url" => "purchase/p_payments");
                

                $sidebar_menu[] = array("name" => "Purchasing","slug"=>"#", "url" => "#", "class" => "fa-shopping-cart", "submenu" => $ap_submenu);
            }
            $acc_submenu = array();
            $acc_submenu[] = array("name" => "Journal Entry", "slug"=>"journal_entry","url" => "accounting/journal_entry");
            $acc_submenu[] = array("name" => "General Ledger", "slug"=>"general_ledger","url" => "accounting/general_ledger");
            $acc_submenu[] = array("name" => "Trial Balance", "slug"=>"neraca_saldo","url" => "accounting/neraca_saldo");


            $acc_submenu[] = array("name" => "Profit and Loss", "slug"=>"laba_rugi","url" => "reports/laba_rugi");
            // $acc_submenu[] = array("name" => "Profit Loss Total", "slug"=>"labarugi_total","url" => "reports/labarugi_total");
            // $rpt_submenu[] = array("name" => "Profit Loss Project", "slug"=>"laba_rugi","url" => "reports/laba_rugi");
            
            $acc_submenu[] = array("name" => "Balance Sheet","slug"=>"neraca", "url" => "reports/neraca");
            $acc_submenu[] = array("name" => "Aging Receivable", "slug"=>"aging_receivable","url" => "reports/aging_receivable");
            $acc_submenu[] = array("name" => "Aging Payable", "slug"=>"aging_payable","url" => "reports/aging_payable");
            $acc_submenu[] = array("name" => "Sales Reports", "slug"=>"r_sales","url" => "reports/r_sales");
            $acc_submenu[] = array("name" => "Cash Flow Reports", "slug"=>"cashflow","url" => "reports/cashflow");
            $acc_submenu[] = array("name" => "Budgeting", "slug"=>"budgeting","url" => "reports/budgeting");

            if($is_admin || $user_type == 'direktur_utama' || $user_type == 'direktur' || $user_type == 'manager' || $user_type == 'finance'){
                $sidebar_menu[] = array("name" => "Accounting Reports","slug"=>"accounting", "url" => "#", "class" => "fa-bar-chart", "submenu" => $acc_submenu);
            }
            $rpt_submenu = array();


            // $sidebar_menu[] = array("name" => "", "slug"=>"#","url" => "#", "class" => "fa-line-chart", "submenu" => $rpt_submenu);
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

            if($is_admin || $user_type == "manager" || $user_type == "super_admin"){
                $sidebar_menu[] = array("name" => "Input Master", "slug"=>"","url" => "#", "class" => "fa-list", "submenu" => $master_submenu);
            
            }
            // ----- END MENU MASTER
            if($is_admin || $user_type == "manager" || $user_type == "super_admin"){
                $sidebar_menu[] = array("name" => "Settings", "slug"=> "general","url" => "settings/general", "class" => "fa-cogs");    
            }

        

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