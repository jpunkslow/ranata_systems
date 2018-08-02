ALTER TABLE `master_assets` ADD `asset_name` VARCHAR(250) NOT NULL AFTER `activa_code`;
ALTER TABLE `sales_invoices` ADD `fid_project` INTEGER(11) NOT NULL AFTER `fid_order`;