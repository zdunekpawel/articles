set timing on
spool load_data.log
 
truncate table h_lineitem;
truncate table h_order;
truncate table h_part;
truncate table h_customer;
truncate table h_nation;
truncate table h_region;
truncate table h_partsupp;
truncate table h_supplier;
alter session enable parallel dml;
insert /*+append*/into h_lineitem
select L_ORDERKEY,
       L_PARTKEY,
       L_SUPPKEY,
       L_LINENUMBER,
       L_QUANTITY,
       L_EXTENDEDPRICE,
       L_DISCOUNT,
       L_TAX,
       L_RETURNFLAG,
       L_LINESTATUS,
       to_date(L_SHIPDATE, 'YYYY-MM-DD'),
       to_date(L_COMMITDATE, 'YYYY-MM-DD'),
       to_date(L_RECEIPTDATE, 'YYYY-MM-DD'),
       L_SHIPINSTRUCT,
       L_SHIPMODE,
       L_COMMENT
from lineitem_ext;
insert /*+append*/ into h_partsupp  select * from partsupp_ext;
insert /*+append*/ into h_part  select * from part_ext;
insert /*+append*/ into h_order
select o_orderkey,
       o_custkey,
       o_orderstatus,
       o_totalprice,
       to_date(o_orderdate, 'YYYY-MM-DD'),
       O_ORDERPRIORITY,
       o_clerk,
       O_SHIPPRIORITY,
       o_comment
from order_ext;
insert /*+append*/ into h_customer  select * from customer_ext;
insert /*+append*/ into h_supplier  select * from supplier_ext;
insert  /*+append*/ into h_nation  select * from nation_ext;
insert /*+append*/ into h_region  select * from region_ext;
commit;
spool off