/* 
=============================================================
DDL Script : Create Bronze Tables
=============================================================
Script Purpose :
  thwsoi script creates table in the Bronze Schema, dropping exisitng tables
  if they already exists. 
    Run this Script to re-define the DDL structure of Bronze Tables
===========================================================================
*/



if object_id ('bronze.crm_cust_info', 'U') is not null 
	drop table bronze.crm_cust_info;
go
create table bronze.crm_cust_info(
	cst_id INT,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_marital_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date DATE
);
go

if object_id ('bronze.crm_prd_info', 'U') is not null 
	drop table bronze.crm_prd_info;
go
create table bronze.crm_prd_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost int, 
prd_line NVARCHAR(50),
prd_start_date DATETIME,
prd_end_date DATETIME
);
go

if object_id ('bronze.crm_sales_details', 'U') is not null 
	drop table bronze.crm_sales_details;
go
create table bronze.crm_sales_details(
	sls_ord_num VARCHAR(50),
	sls_prd_key VARCHAR(50),
	sls_cust_id INT,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales Int,
	sls_quntity int,
	sls_price int
);
go

if object_id ('bronze.erp_loc_a101', 'U') is not null 
	drop table bronze.erp_loc_a101;
go
create table bronze.erp_loc_a101(
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);
go

if object_id ('bronze.erp_cust_az12', 'U') is not null 
	drop table bronze.erp_cust_az12;
go
create table bronze.erp_cust_az12(
	cid NVARCHAR(50),
	bdate NVARCHAR(50),
	gen NVARCHAR(50)
);
go

if object_id ('bronze.erp_px_cat_g1v2', 'U') is not null 
	drop table bronze.erp_px_cat_g1v2;
go 
create table bronze.erp_px_cat_g1v2 (
	id NVARCHAR(50), 
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);
go
