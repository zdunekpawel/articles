set timing on
 
spool load_object.log
 
drop table region_ext;
drop table nation_ext;
drop table supplier_ext;
drop table customer_ext;
drop table order_ext;
drop table part_ext;
drop table partsupp_ext;
drop table lineitem_ext;
 
CREATE TABLE region_ext (r_regionkey  NUMBER(10),
                         r_name varchar2(25),
                         r_comment varchar(152))
ORGANIZATION EXTERNAL (
TYPE oracle_loader
DEFAULT DIRECTORY tpch_dir2
ACCESS PARAMETERS (
       RECORDS DELIMITED BY NEWLINE
       BADFILE 'bad_%a_%p.bad'
       LOGFILE 'log_%a_%p.log'
       FIELDS TERMINATED BY '|'
       MISSING FIELD VALUES ARE NULL)
       LOCATION ('region.tbl'))
NOPARALLEL
REJECT LIMIT 0
NOMONITORING;
 
CREATE TABLE nation_ext (n_nationkey  NUMBER(10),
                         n_name varchar2(25),
                         n_regionkey number(10),
                         n_comment varchar(152))
ORGANIZATION EXTERNAL (
TYPE oracle_loader
DEFAULT DIRECTORY tpch_dir2
ACCESS PARAMETERS (
       RECORDS DELIMITED BY NEWLINE
       BADFILE 'bad_%a_%p.bad'
       LOGFILE 'log_%a_%p.log'
       FIELDS TERMINATED BY '|'
       MISSING FIELD VALUES ARE NULL)
       LOCATION ('nation.tbl'))
NOPARALLEL
REJECT LIMIT 0
NOMONITORING;

CREATE TABLE supplier_ext (S_SUPPKEY NUMBER(10),
                           S_NAME VARCHAR2(25),
                           S_ADDRESS VARCHAR2(40),
                           S_NATIONKEY NUMBER(10),
                           S_PHONE VARCHAR2(15),
                           S_ACCTBAL NUMBER,
                           S_COMMENT VARCHAR2(101))
ORGANIZATION EXTERNAL (
TYPE oracle_loader
DEFAULT DIRECTORY tpch_dir2
ACCESS PARAMETERS (
       RECORDS DELIMITED BY NEWLINE
       BADFILE 'bad_%a_%p.bad'
       LOGFILE 'log_%a_%p.log'
       FIELDS TERMINATED BY '|'
       MISSING FIELD VALUES ARE NULL)
LOCATION ('supplier.tbl.1','supplier.tbl.2') )
PARALLEL 2
REJECT LIMIT 0
NOMONITORING;
 

CREATE TABLE customer_ext (C_CUSTKEY NUMBER(10),
                           C_NAME VARCHAR2(25),
                           C_ADDRESS VARCHAR2(40),
                           C_NATIONKEY NUMBER(10),
                           C_PHONE VARCHAR2(15),
                           C_ACCTBAL NUMBER,
                           C_MKTSEGMENT VARCHAR2(10),
                           C_COMMENT VARCHAR2(117))
ORGANIZATION EXTERNAL (
TYPE oracle_loader
DEFAULT DIRECTORY tpch_dir2
ACCESS PARAMETERS (
       RECORDS DELIMITED BY NEWLINE
       BADFILE 'bad_%a_%p.bad'
       LOGFILE 'log_%a_%p.log'
       FIELDS TERMINATED BY '|'
       MISSING FIELD VALUES ARE NULL)
LOCATION ('customer.tbl.1','customer.tbl.2') )
PARALLEL 2
REJECT LIMIT 0
NOMONITORING;

CREATE TABLE order_ext (O_ORDERKEY NUMBER(10),
                        O_CUSTKEY NUMBER(10),
                        O_ORDERSTATUS CHAR(1),
                        O_TOTALPRICE NUMBER,
                        O_ORDERDATE VARCHAR2(10),
                        O_ORDERPRIORITY VARCHAR2(15),
                        O_CLERK VARCHAR2(15),
                        O_SHIPPRIORITY NUMBER(38),
                        O_COMMENT VARCHAR2(79))
ORGANIZATION EXTERNAL (
TYPE oracle_loader
DEFAULT DIRECTORY tpch_dir2
ACCESS PARAMETERS (
       RECORDS DELIMITED BY NEWLINE
       BADFILE 'bad_%a_%p.bad'
       LOGFILE 'log_%a_%p.log'
       FIELDS TERMINATED BY '|'
       MISSING FIELD VALUES ARE NULL)
LOCATION ('orders.tbl.1','orders.tbl.2'))
PARALLEL 2
REJECT LIMIT 0
NOMONITORING;
 
CREATE TABLE part_ext (P_PARTKEY NUMBER(10),
                       P_NAME VARCHAR2(55),
                       P_MFGR VARCHAR2(25),
                       P_BRAND VARCHAR2(10),
                       P_TYPE VARCHAR2(25),
                       P_SIZE NUMBER(38),
                       P_CONTAINER VARCHAR2(10),
                       P_RETAILPRICE NUMBER,
                       P_COMMENT VARCHAR2(23))
ORGANIZATION EXTERNAL (
TYPE oracle_loader
DEFAULT DIRECTORY tpch_dir2
ACCESS PARAMETERS (
       RECORDS DELIMITED BY NEWLINE
       BADFILE 'bad_%a_%p.bad'
       LOGFILE 'log_%a_%p.log'
       FIELDS TERMINATED BY '|'
       MISSING FIELD VALUES ARE NULL)
LOCATION ('part.tbl.1','part.tbl.2') )
PARALLEL 2
REJECT LIMIT 0
NOMONITORING;

CREATE TABLE partsupp_ext (PS_PARTKEY NUMBER(10),
                           PS_SUPPKEY NUMBER(10),
                           PS_AVAILQTY NUMBER(38),
                           PS_SUPPLYCOST NUMBER,
                           PS_COMMENT VARCHAR2(199))
ORGANIZATION EXTERNAL (
TYPE oracle_loader
DEFAULT DIRECTORY tpch_dir2
ACCESS PARAMETERS (
       RECORDS DELIMITED BY NEWLINE
       BADFILE 'bad_%a_%p.bad'
       LOGFILE 'log_%a_%p.log'
       FIELDS TERMINATED BY '|'
       MISSING FIELD VALUES ARE NULL)
LOCATION ('partsupp.tbl.1','partsupp.tbl.2'))
PARALLEL 2
REJECT LIMIT 0
NOMONITORING;
 
CREATE TABLE lineitem_ext (L_ORDERKEY  NUMBER(10),
                           L_PARTKEY NUMBER(10),
                           L_SUPPKEY NUMBER(10),
                           L_LINENUMBER  NUMBER(38),
                           L_QUANTITY NUMBER,
                           L_EXTENDEDPRICE   NUMBER,
                           L_DISCOUNT NUMBER,
                           L_TAX  NUMBER,
                           L_RETURNFLAG  CHAR(1),
                           L_LINESTATUS CHAR(1),
                           L_SHIPDATE  VARCHAR2(10),
                           L_COMMITDATE VARCHAR2(10),
                           L_RECEIPTDATE  VARCHAR2(10),
                           L_SHIPINSTRUCT  VARCHAR2(25),
                           L_SHIPMODE VARCHAR2(10),
                           L_COMMENT VARCHAR2(44))
ORGANIZATION EXTERNAL (
TYPE oracle_loader
DEFAULT DIRECTORY tpch_dir2
ACCESS PARAMETERS (
       RECORDS DELIMITED BY NEWLINE
       BADFILE 'bad_%a_%p.bad'
       LOGFILE 'log_%a_%p.log'
       FIELDS TERMINATED BY '|'
       MISSING FIELD VALUES ARE NULL)
LOCATION ('lineitem.tbl.1','lineitem.tbl.2'))
PARALLEL 2
REJECT LIMIT 0
NOMONITORING;
*/