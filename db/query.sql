ALTER TABLE `sales_invoices` ADD `amount` DOUBLE NOT NULL AFTER `currency`, ADD `residual` DOUBLE NOT NULL AFTER `amount`;
SELECT
	a.*,
	b.name,
	SUM(IF(CURRENT_DATE() < a.inv_date  = 30, a.amount, 0 )) AS ONE,
	SUM(IF(CURRENT_DATE() < a.inv_date  = 30, a.amount, 0 )) AS ONE
FROM
	sales_invoices a
JOIN master_customers b ON b.id = a.fid_cust 
GROUP BY
	b.name;


TRUNCATE `purchase_invoices`;
TRUNCATE `purchase_invoices_items`;
TRUNCATE `purchase_order`;
TRUNCATE `purchase_order_items`;
TRUNCATE `purchase_payments`;
TRUNCATE `purchase_request`;
TRUNCATE `purchase_request_items`;
TRUNCATE `sales_invoices`;
TRUNCATE `sales_invoices_items`;
TRUNCATE `sales_order`;
TRUNCATE `sales_order_items`;
TRUNCATE `sales_payments`;
TRUNCATE `sales_quotation`;
TRUNCATE `sales_quotation_items`;
TRUNCATE `transaction_journal`;
TRUNCATE `transaction_journal_header`;

CREATE 
	OR REPLACE VIEW v_aging_sales AS SELECT
	a.id,
	a.fid_cust,
	a.inv_date,
	a.currency,
	a.CODE,
	b.NAME,
	b.termin,
	a.amount,
	a.residual,
	DATEDIFF( CURDATE( ), a.inv_date ) AS jumlah 
FROM
	sales_invoices a
	JOIN master_customers b ON a.fid_cust = b.id 
WHERE
	a.STATUS = "posting" 
	AND a.paid IN ( "Not Paid", "Credit" ) 
	AND a.deleted = 0 
	AND a.inv_date <= CURDATE( ) 
GROUP BY
	a.CODE;

SELECT * FROM transaction_journal WHERE date > DATE_SUB(NOW(), INTERVAL 30 DAY) ORDER BY date DESC; 