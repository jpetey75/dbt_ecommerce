select 

	--id fields 
	order_id,
	user_id,

	--order details
	status as order_status,
	num_of_item as num_order_items,

	--order timestamps in US central time
	{{ ntz_to_reporting_tz('created_at') }}  as order_created_at,
	{{ ntz_to_reporting_tz('shipped_at') }}  as order_shipped_at

from {{ source('ecommerce','orders') }}
