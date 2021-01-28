#s5pdb014 - Insert into monitoring.querie_group table

#query_group table checks for lsp2

BEGIN;

INSERT INTO TABLE query_group values (''lsp2','pg','transaction_breakdown','select count(distinct transaction_breakdown_id) from odc.servicing.transaction_breakdown;','','transaction_breakdown_id');
INSERT INTO TABLE query_group values (''lsp2','sno','transaction_breakdown','select count(distinct transaction_breakdown_id) from prod_legacy.odc_lsp2.transaction_breakdown;','','transaction_breakdown_id');

INSERT INTO TABLE query_group values (''lsp2','pg','alternate_history_breakdown','select count(distinct transaction_id) from odc.servicing.alternate_history_breakdown;','','transaction_id);
INSERT INTO TABLE query_group values (''lsp2','sno','alternate_history_breakdown','select count(distinct transaction_id) from prod_legacy.odc_lsp2.alternate_history_breakdown;','','transaction_id);

INSERT INTO TABLE query_group values (''lsp2','pg','alternate_history_past_due_bucket','select max(effective_date) from odc.servicing.alternate_history_past_due_bucket;','','effective_date');
INSERT INTO TABLE query_group values (''lsp2','sno','alternate_history_past_due_bucket','select max(effective_date) from prod_legacy.odc_lsp2.alternate_history_past_due_bucket;','','effective_date');

INSERT INTO TABLE query_group values (''lsp2','pg','changelog','select count(distinct id) from odc.servicing.changelog;','','id);
INSERT INTO TABLE query_group values (''lsp2','sno','changelog','select count(distinct id) from prod_legacy.odc_lsp2.changelog;','','id);

INSERT INTO TABLE query_group values (''lsp2','pg','debt','select count(distinct loan_id) from odc.servicing.debt;','','loan_id');
INSERT INTO TABLE query_group values (''lsp2','sno','debt','select count(distinct loan_id) from prod_legacy.odc_lsp2.debt;','','loan_id');

INSERT INTO TABLE query_group values (''lsp2','pg','financial_transaction','select count(distinct odc.servicing.financial_transaction_id) from financial_transaction;','','financial_transaction_id');
INSERT INTO TABLE query_group values (''lsp2','sno','financial_transaction','select count(distinct prod_legacy.odc_lsp2.financial_transaction_id) from financial_transaction;','','financial_transaction_id');

INSERT INTO TABLE query_group values (''lsp2','pg','job_audit','select count(distinct job_audit_id) from odc.servicing.job_audit;','','job_audit_id');
INSERT INTO TABLE query_group values (''lsp2','sno','job_audit','select count(distinct job_audit_id) from prod_legacy.odc_lsp2.job_audit;','','job_audit_id');

INSERT INTO TABLE query_group values (''lsp2','pg','loan_migration_result','select count(distinct loan_id) from odc.servicing.loan_migration_result;','','loan_id');
INSERT INTO TABLE query_group values (''lsp2','sno','loan_migration_result','select count(distinct loan_id) from servicing.loan_migration_result;','','loan_id');

INSERT INTO TABLE query_group values (''lsp2','pg','makeup_transaction','select count(distinct makeup_transaction_id) from odc.servicing.makeup_transaction;','','makeup_transaction_id');
INSERT INTO TABLE query_group values (''lsp2','sno','makeup_transaction','select count(distinct makeup_transaction_id) from prod_legacy.odc_lsp2.makeup_transaction;','','makeup_transaction_id');

INSERT INTO TABLE query_group values (''lsp2','pg','past_due_bucket','select count(distinct transaction_id) from odc.servicing.past_due_bucket;','','transaction_id');
INSERT INTO TABLE query_group values (''lsp2','sno','past_due_bucket','select count(distinct transaction_id) from prod_legacy.odc_lsp2.past_due_bucket;','','transaction_id');

INSERT INTO TABLE query_group values (''lsp2','pg','repayment_terms','select count(repayment_terms_id), to_char(max(effective_date),'YYYY-MM-DD') from odc.servicing.repayment_terms group by 2;','effective_date','repayment_terms_id');
INSERT INTO TABLE query_group values (''lsp2','sno','repayment_terms','select count(repayment_terms_id), to_char(max(effective_date),'YYYY-MM-DD') from prod_legacy.odc_lsp2.repayment_terms group by 2;','effective_date','repayment_terms_id');

INSERT INTO TABLE query_group values (''lsp2','pg','transaction',''select count(distinct transaction_id) from odc.servicing.transaction;','','transaction_id');
INSERT INTO TABLE query_group values (''lsp2','sno','transaction',''select count(distinct transaction_id) from prod_legacy.odc_lsp2.transaction;','','transaction_id');

INSERT INTO TABLE query_group values (''lsp2','pg','transaction_repayment_terms','select count(distinct transaction_id) from odc.servicing.transaction_repayment_terms;','','transaction_id');
INSERT INTO TABLE query_group values (''lsp2','sno','transaction_repayment_terms','select count(distinct transaction_id) from prod_legacy.odc_lsp2.transaction_repayment_terms;','','transaction_id');

INSERT INTO TABLE query_group values (''lsp2','pg','transaction_type','select count(distinct type) from odc.servicing.transaction_type;','','type');
INSERT INTO TABLE query_group values (''lsp2','sno','transaction_repayment_terms','select count(distinct transaction_id) from prod_legacy.odc_lsp2.transaction_repayment_terms;','','transaction_id');

INSERT INTO TABLE query_group values (''lsp2','pg','workout_calendar_loc_transaction','select count(distinct workout_calendar_id) from odc.servicing.workout_calendar_loc_transaction;','','workout_calendar_id');
INSERT INTO TABLE query_group values (''lsp2','sno','workout_calendar_loc_transaction','select count(distinct workout_calendar_id) from prod_legacy.odc_lsp2.workout_calendar_loc_transaction;','','workout_calendar_id');

INSERT INTO TABLE query_group values (''lsp2','pg','one_time_payment_transaction','select count(distinct one_time_payment_id) from odc.servicing.one_time_payment_transaction;','','one_time_payment_id');
INSERT INTO TABLE query_group values (''lsp2','sno','one_time_payment_transaction','select count(distinct one_time_payment_id) from prod_legacy.odc_lsp2.one_time_payment_transaction;','','one_time_payment_id');

INSERT INTO TABLE query_group values (''lsp2','pg','purchase_transaction','select count(distinct purchase_transaction_id) from odc.servicing.purchase_transaction;','','purchase_transaction_id/');
INSERT INTO TABLE query_group values (''lsp2','sno','purchase_transaction','select count(distinct purchase_transaction_id) from prod_legacy.odc_lsp2.purchase_transaction;','','purchase_transaction_id/');

COMMIT;
