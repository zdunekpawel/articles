set timing on
spool heap_objects.log
DROP TABLE H_CUSTOMER CASCADE CONSTRAINTS ;
DROP TABLE H_LINEITEM CASCADE CONSTRAINTS ;
DROP TABLE H_NATION CASCADE CONSTRAINTS ;
DROP TABLE H_ORDER CASCADE CONSTRAINTS ;
DROP TABLE H_PART CASCADE CONSTRAINTS ;
DROP TABLE H_PARTSUPP CASCADE CONSTRAINTS ;
DROP TABLE H_REGION CASCADE CONSTRAINTS ;
DROP TABLE H_SUPPLIER CASCADE CONSTRAINTS ;
 
CREATE TABLE H_CUSTOMER (c_custkey NUMBER(10) NOT NULL,
                         c_name VARCHAR2(25) NOT NULL,
                         c_address VARCHAR2(40) NOT NULL,
                         c_nationkey NUMBER(10) NOT NULL ,
                         c_phone VARCHAR2(15) NOT NULL,
                         c_acctbal NUMBER NOT NULL,
                         c_mktsegment VARCHAR2(10) NOT NULL,
                         c_comment VARCHAR2(117) NOT NULL)
PARALLEL 2;
 
CREATE TABLE H_LINEITEM (l_orderkey NUMBER(10) NOT NULL,
                         l_partkey NUMBER(10) NOT NULL,
                         l_suppkey NUMBER(10) NOT NULL ,
                         l_linenumber INTEGER  NOT NULL ,
                         l_quantity NUMBER NOT NULL,
                         l_extendedprice NUMBER NOT NULL,
                         l_discount NUMBER NOT NULL,
                         l_tax NUMBER NOT NULL,
                         l_returnflag CHAR(1) NOT NULL ,
                         l_linestatus CHAR(1) NOT NULL,
                         l_shipdate DATE NOT NULL,
                         l_commitdate DATE NOT NULL,
                         l_receiptdate DATE NOT NULL,
                         l_shipinstruct VARCHAR2(25) NOT NULL,
                         l_shipmode VARCHAR2(10) NOT NULL,
                         l_comment VARCHAR2(44) NOT NULL)
PARALLEL 2;
 
CREATE TABLE H_NATION (n_nationkey NUMBER(10) NOT NULL,
                       n_name VARCHAR2(25) NOT NULL,
                       n_regionkey NUMBER (10) NOT NULL,
                       n_comment VARCHAR2 (152) NOT NULL)
NOPARALLEL;
 
CREATE TABLE H_ORDER (o_orderkey NUMBER (10)  NOT NULL,
                      o_custkey NUMBER(10)  NOT NULL,
                      o_orderstatus CHAR(1) NOT NULL,
                      o_totalprice NUMBER NOT NULL,
                      o_orderdate DATE NOT NULL,
                      o_orderpriority VARCHAR2(15) NOT NULL,
                      o_clerk VARCHAR2(15) NOT NULL,
                      o_shippriority INTEGER NOT NULL,
                      o_comment VARCHAR2(79) NOT NULL)
PARALLEL 2;
 
CREATE TABLE H_PART (p_partkey NUMBER(10)  NOT NULL,
                     p_name VARCHAR2(55) NOT NULL,
                     p_mfgr VARCHAR2(25) NOT NULL,
                     p_brand VARCHAR2(10) NOT NULL,
                     p_type VARCHAR2(25) NOT NULL,
                     p_size INTEGER NOT NULL,
                     p_container VARCHAR2(10) NOT NULL,
                     p_retailprice NUMBER NOT NULL,
                     p_comment VARCHAR2(23) NOT NULL)
PARALLEL 2;
CREATE TABLE H_PARTSUPP (ps_partkey NUMBER (10)  NOT NULL ,
                         ps_suppkey NUMBER (10)  NOT NULL ,
                         ps_availqty INTEGER NOT NULL,
                         ps_supplycost NUMBER NOT NULL,
                         ps_comment VARCHAR2 (199) NOT NULL)
PARALLEL 2;
 
CREATE TABLE H_REGION (r_regionkey NUMBER (10)  NOT NULL ,
                       r_name VARCHAR2 (25) NOT NULL,
                       r_comment VARCHAR2 (152) NOT NULL)
NOPARALLEL;
 
CREATE TABLE H_SUPPLIER (s_suppkey NUMBER (10)  NOT NULL ,
                         s_name VARCHAR2 (25) NOT NULL,
                         s_address VARCHAR2 (40) NOT NULL,
                         s_nationkey NUMBER (10)  NOT NULL ,
                         s_phone VARCHAR2 (15) NOT NULL,
                         s_acctbal NUMBER NOT NULL,
                         s_comment VARCHAR2 (101) NOT NULL)
PARALLEL 2;
 
spool off