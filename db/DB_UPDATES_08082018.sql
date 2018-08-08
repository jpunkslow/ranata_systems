ALTER TABLE `master_items` ADD `sales_journal_lawan` INT NOT NULL AFTER `sales_journal`;
ALTER TABLE `sales_quotation_items` ADD `basic_price` DOUBLE NOT NULL AFTER `rate`;
