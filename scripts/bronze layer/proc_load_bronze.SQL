/*
==========================================================================



==========================================================================
*/


create or alter procedure bronze.load_bronze as 
begin
	declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
	begin try
		set @batch_start_time = getdate();
		print'========================================='; 
		print ' loading bronze layer';
		print'=========================================';

		print'------------------------------------------';
		print 'loading CRM Table';
		print'------------------------------------------';
		
		set @start_time = getdate();
		print'>> Truncating Table : bronze.crm_cust_info';
		truncate table bronze.crm_cust_info
		print'>> Inserting data Into : bronze.crm_cust_info';
		BULK INSERT	bronze.crm_cust_info
		from 'D:\SQL\SQL Projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock 
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast(datediff(second, @start_time, @end_time ) as varchar(50)) + 'seconds';
		print '>> --------------';

		-- select count(*) from bronze.crm_cust_info
		print'>> Truncating Table : bronze.crm_prd_info'
		truncate table bronze.crm_prd_info
		print'>> Inserting data Into : bronze.crm_prd_info';
		BULK INSERT	bronze.crm_prd_info
		from 'D:\SQL\SQL Projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock 
		);

		-- select * from bronze.crm_prd_info
		print '>> load duration: ' + cast(datediff(second, @start_time, @end_time ) as varchar(50)) + 'seconds';
		print '>> --------------';
		print'>> Truncating Table : bronze.crm_sales_details';
		truncate table bronze.crm_sales_details
		print'>> Inserting data Into : bronze.crm_sales_details';
		BULK INSERT	bronze.crm_sales_details
		from 'D:\SQL\SQL Projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock 
		);
		print'------------------------------------------';
		print 'loading ERP Table';
		print'------------------------------------------';

		print '>> load duration: ' + cast(datediff(second, @start_time, @end_time ) as varchar(50)) + 'seconds';
		print '>> --------------';
		print'>> Truncating Table : bronze.erp_cust_az12';
		truncate table bronze.erp_cust_az12
		print'>> Inserting data Into : bronze.erp_cust_az12';
		BULK INSERT	bronze.erp_cust_az12
		from 'D:\SQL\SQL Projects\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock 
		);

		print '>> load duration: ' + cast(datediff(second, @start_time, @end_time ) as varchar(50)) + 'seconds';
		print '>> --------------';
		print'>> Truncating Table : bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101
		print'>> Inserting data Into : bronze.erp_loc_a101';
		BULK INSERT	bronze.erp_loc_a101
		from 'D:\SQL\SQL Projects\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock 
		);

		print '>> load duration: ' + cast(datediff(second, @start_time, @end_time ) as varchar(50)) + 'seconds';
		print '>> --------------';
		print'>> Truncating Table : bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2
		print'>> Inserting data Into : bronze.erp_px_cat_g1v2';
		BULK INSERT	bronze.erp_px_cat_g1v2
		from 'D:\SQL\SQL Projects\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock 
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast(datediff(second, @start_time, @end_time ) as varchar(50)) + 'seconds';
		print '>> --------------';

		set @batch_end_time = getdate();
		print '=====================================';
		print 'Loading Bronze Layer is completed';
		print ' - Total Load Duration: ' + cast(datediff(second, @batch_start_time, @batch_end_time ) as varchar(50)) + 'seconds';
		print '====================================';
	end try 
	begin catch 
		print'=====================================';
		print'error message' + error_message();
		print'error message' + cast(error_number() as varchar(50));
		print'error message' + cast(error_state() as varchar(50)); 
		print'=====================================';
	end catch 
end 
