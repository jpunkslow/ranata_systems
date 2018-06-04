<div id="page-content" class="clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Journal Entry</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <!-- <table id="generalaccounts-table" class="display" cellspacing="0" width="100%">            
            </table> -->
            <hr>

            <form action="<?php echo base_url()?>accounting/journal_entry/jurnal_input_save" method="post" name="frmJurnal" id="frmJurnal" class="general-form" enctype="multipart/form-data">
<!--                   <input type="hidden" name="mode" id="mode" value="<?php echo $mode;?>" />
 -->                  <input type="hidden" name="id" id="id" value="<?php echo $row->id;?>" />
                  <input type="hidden" name="modul"  value="1" />
                    <input type="hidden" name="menuid"  value="1" />
                  <input id="idf" value="1" type="hidden" />                
                       
                       <!--  <div class="form-group">
                            <div class="col-xs-1"></div>
                            <div class="col-xs-1"><label>Periode</label></div>
                            <div class="col-xs-6"><strong><?php echo date('Y');?></strong></div>
                        </div> -->
                       
                       <div class="form-group">
                            <label for="NamaLengkap" class="control-label col-md-2">Voucher Code</label>
                            <div class="col-md-4">
                                
                                <input placeholder="Voucher Code" class="form-control" name="journal_code" type="text"  id="no_bukti" value="<?php echo $row->code;?>" required />
                               
                            </div>
                        </div> 

                          <div class="form-group">
                            <label for="NamaLengkap" class="control-label col-md-2">Date</label>
                            <div class="col-md-4">
                                
                                <input placeholder="Y-m-d" class="form-control tgl" name="date" type="text"  id="date" value="<?php echo $row->date;?>"  />
                               
                            </div>
                        </div> 
                        
                        
                        <div class="form-group">
                            <label for="NamaLengkap" class="control-label col-md-2">Description</label>
                            <div class="col-md-8">
                                
                               <textarea name="description" class="form-control" id="description" placeholder="Description Entry" ><?php echo $row->description;?></textarea>
                               
                            </div>
                        </div> 


                        <?php if(count($detail)>0){ ?>
                        <div class="form-group">
                            <div class="col-xs-4"><strong>Accounts</strong></div>
                            <div class="col-xs-2"><strong>Description</strong></div>
                            
                            <div class="col-xs-2"><strong>Debet</strong></div>
                            <div class="col-xs-2"><strong>Credit</strong></div>
                            <div class="col-xs-1"><strong>Delete</strong></div>
                        </div>
            <?php               
                            foreach($detail as $rd)
                                {
                ?>
                        <div class="form-group">
                            <div ><input type="hidden" name="coa_e[<?php echo $rd->id;?>]" value="<?php echo $rd->id;?>" /></div>
                            <div class="col-xs-4"><?php echo $rd->account_number;?>-<?php echo $rd->account_name;?></div>
                            <div class="col-xs-2"><input  type="text" class="form-control input-sm" name="desc[<?php echo $rd->id;?>]" value="<?php echo $rd->description; ?>"  /></div>
                            <div class="col-xs-2"><input  type="text" class="form-control input-sm" name="debet_e[<?php echo $rd->id;?>]" value="<?php echo $rd->debet; ?>"  /></div>
                            <div class="col-xs-2"><input   type="text" class="form-control input-sm" name="kredit_e[<?php echo $rd->id;?>]" value="<?php echo $rd->credit; ?>"  /></div>
                            <div class="col-xs-1 checkbox">
                        <input type="checkbox" name="coa_cb[]" value="<?php echo $rd->id;?>">
                            </div>
                        </div>
                <?php
                                }
                    ?>
                    
                    <?php       
                        }
            //$arrCG=$coa->tampilCG("",0,0);
            $sl_coa="<select name=coa[] class=form-control validate-hidden>";
                    
                            foreach ($coa as $key )
                                {
                                    // $ip=$value->id;
                                    $sl_coa.= "<option value=$key->id>&nbsp;&nbsp;&nbsp;&nbsp;".$key->account_number." - ".$key->account_name. "</option>";
                                }
                        
                
            $sl_coa.="</select>";
            
            
        ?>
        <div class="form-group">
         
           <div class="col-xs-9">
                <a class="btn btn-primary btn-sm"  onclick="addRincian('<?php echo $sl_coa;?>'); return false;"><i class="glyphicon glyphicon-plus"></i> Tambah Rincian</a> </div>
        </div>  
        
        <div id="divAkun"></div>
        
        <div class="form-group">
           <div class="col-xs-9">
                <button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-floppy-disk"></i>
                    Simpan Transaksi Jurnal Umum
                </button>
            </div>
        </div>
      </form>
        </div>
    </div>
</div>


<script type="text/javascript">
$(document).ready(function () {

        $("#frmJurnal .select2").select2();
        setDatePicker("#date");

    });

    function addRincian(sl_coa) {
    var idf = document.getElementById("idf").value;
    stre="<div class='form-group'  id='srow" + idf + "'><div class='controls'>";
    stre=stre+" <div class='col-xs-4'>";
    stre=stre+sl_coa;
    stre=stre+"</div>";
    stre=stre+" <div class='col-xs-2'>";
    stre=stre+"<input placeholder='Description'  type='text' class='form-control input-sm' name='desc[]'   />";
    stre=stre+"</div>";

    stre=stre+" <div class='col-xs-2'>";
    stre=stre+"<input placeholder='Debet'  type='text' class='form-control input-sm' name='debet[]'   />";
    stre=stre+"</div>";
    stre=stre+" <div class='col-xs-2'>";
    stre=stre+"<input placeholder='Kredit'  type='text' class='form-control input-sm' name='credit[]'   />";
    stre=stre+"</div>";

    stre=stre+"<div class='col-xs-1'> <button type='button' class='btn btn-danger btn-sm' title='Hapus Rincian !' onclick='removeFormField(\"#srow" + idf + "\"); return false;'><i class='glyphicon glyphicon-remove'></i></button></div> </div>";
    $("#divAkun").append(stre);
    idf = (idf-1) + 3;
    document.getElementById("idf").value = idf;
}
function removeFormField(idf) {
    $(idf).remove();
}
</script>
