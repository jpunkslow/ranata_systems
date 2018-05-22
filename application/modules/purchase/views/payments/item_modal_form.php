
                    <?php if($query){ foreach($query as $row){ ?>
                    <tr>
                        <td><strong><?php echo $row->code ?></strong></td>
                        <td class="text-center "><?php echo $row->paid; ?></td>
                        <td class="w50"><?php echo format_to_date($row->inv_date) ?></td>

                        <td align="right" class="w150"><?php echo to_currency($row->sub_total) ?></td>
                        <td class="text-center w50">
                            <a href="#" class="btn btn-primary" title="Mark As Pay" data-post-id="<?php echo $row->id ?>" data-act="ajax-modal" data-title="INVOICES <?php echo $row->code ?>" data-action-url="<?php echo get_uri("purchase/p_payments/modal_form_pay") ?>"><i class="fa fa-money"></i></a>
                        </td>
                    </tr>
                <?php }
                    }else{ ?>
                        <tr>
                            <td colspan="5"><center>No Records Found</center></td>
                        </tr>
                <?php   } ?>
               
