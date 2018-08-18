<?php 




if (!function_exists('getSaldoAwal')) {

    function getSaldoAwal($fid_coa,$periode) {
        $ci = get_instance();

        $data = $ci->db->query();

        // $data_d = $ci->db->query("SELECT SUM( debet ) FROM master_saldo_awal WHERE fid_coa = '$fid_coa' AND periode = '$periode'")->row();
        // $data_c = $ci->db->query("SELECT SUM( credit ) FROM master_saldo_awal WHERE fid_coa = '$fid_coa' AND periode = '$periode'")->row();
        // $debet = $data_d->debet + $data_c->credit;
    }

}