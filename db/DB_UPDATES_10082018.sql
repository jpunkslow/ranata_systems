ALTER TABLE `purchase_invoices` ADD `sub_total` DOUBLE NOT NULL AFTER `currency`;

ALTER TABLE `transaction_journal_header` ADD `fid_project` INT NOT NULL AFTER `fid_coa`;
ALTER TABLE `purchase_invoices` ADD `end_date` DATE NOT NULL AFTER `inv_date`;