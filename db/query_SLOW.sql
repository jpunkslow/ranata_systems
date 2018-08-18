SELECT IFNULL(SUM(debet) + SUM(credit),0) AS total FROM transaction_journal JOIN acc_coa_type ON acc_coa_type.id = transaction_journal.fid_coa WHERE account_type in ('Pendapatan','Pendapatan Lain-lain');
SELECT IFNULL(SUM(debet) + SUM(credit),0) AS total FROM transaction_journal JOIN acc_coa_type ON acc_coa_type.id = transaction_journal.fid_coa WHERE account_type in ('Harga Pokok Penjualan','Beban Penjualan','Beban Administrasi Umum','Beban Lain-lain');