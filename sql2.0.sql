-------------------复杂查询---------------
-- 子查询作为查询条件来源
SELECT cust_id
  FROM orders
  WHERE order_num IN (
    SELECT order_num
      FROM orderitems
      WHERE prod_id = '123'
  );

-- 子查询作为新字段
SELECT cust_name,
       cust_state,
       ( SELECT Count(*)
         FROM orders
         WHERE orders.cust_id = customers.cust_id
        ) AS num_orders
  FROM customers
  ORDER BY cust_name;
  
-- 按条件查询两个表的数据（与下面的inner join  on结果相同）
SELECT vend_name, prod_name, prod_price
  FROM vendors, products
  WHERE vendors.vend_id = products.vend_id
  ORDER BY vend_name, prod_name;
  
-- inner join
SELECT vend_name, prod_name, prod_price
  FROM vendors INNER JOIN products
    ON vendors.vend_id = products.vend_id;

-- inner join 和left or right join 区别
  -- inner-join必须两个表的字段都包含值
  -- letf-join 左表有值就可以

SELECT customers.cust_id, orders.order_num
  FROM customers INNER JOIN orders
  ON customers.cust_id = orders.cust_id;
-- +---------+-----------+
-- | cust_id | order_num |
-- +---------+-----------+
-- |   10001 |     20005 |
-- |   10001 |     20009 |
-- |   10003 |     20006 |
-- |   10004 |     20007 |
-- |   10005 |     20008 |
-- +---------+-----------+
SELECT customers.cust_id, orders.order_num
  FROM customers LEFT OUTER JOIN orders
  ON customers.cust_id = orders.cust_id;
-- +---------+-----------+
-- | cust_id | order_num |
-- +---------+-----------+
-- |   10001 |     20005 |
-- |   10001 |     20009 |
-- |   10002 |      NULL |
-- |   10003 |     20006 |
-- |   10004 |     20007 |
-- |   10005 |     20008 |

-- 组合查询 union
UNION的每个查询必须含有相同的列，表达式或者聚集函数，有些不用的数据类型可能不兼容（次序无关紧要）
SELECT vend_id, prod_id, prod_price
  FROM products
  WHERE prod_price <= 5
UNION
SELECT vend_id, prod_id, prod_price
  FROM products
  WHERE vend_id IN (1001, 1002);
  
两个表不匹配的字段可以用null填充
SELECT uid, order_id, null from AC_USER union SELECT uid,null,time from AC_CLASS

-- 插入数据
-- more safe insert
INSERT INTO customers(cust_name,
	cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email)
    VALUES('Pep E. LaPew',
			      '100 Street',
            'Los Angeles',
            'CA',
            '90046',
            'USA',
            NULL,
            NULL);
-- insert from other table
INSERT INTO customers (cust_id,
     cust_name,
     cust_address,
     cust_city,
     cust_state,
     cust_zip,
     cust_country,
     cust_contact,
     cust_email
  )
  SELECT cust_id,
     cust_name,
     cust_address,
     cust_city,
     cust_state,
     cust_zip,
     cust_country,
     cust_contact,
     cust_email
  FROM custnew;
  
  -- 更新和删除数据
  
    UPDATE customers
      SET cust_email = 'jack@gmail.com',
          cust_name = 'jack'
      WHERE cust_id = 10005;
      
      DELETE FROM customers
        WHERE cust_id = 10006;
        
 --- 创建和操纵表
 CREATE TABLE customers
(
  cust_id      int       NOT NULL AUTO_INCREMENT,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL ,
  PRIMARY KEY (cust_id)
) ENGINE=InnoDB;
-- add column
ALTER TABLE vendors
  ADD vend_phone char(20);

-- drop column
ALTER TABLE vendors
  DROP COLUMN vend_phone;

-- Define foreign keys
ALTER TABLE orderitems
  ADD CONSTRAINT fk_orderitems_orders FOREIGN KEY (order_num)
  REFERENCES orders (order_num);

ALTER TABLE orderitems
  ADD CONSTRAINT fk_orderitems_products FOREIGN KEY (prod_id)
  REFERENCES products (prod_id);

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_customers FOREIGN KEY (cust_id)
  REFERENCES customers (cust_id);

ALTER TABLE products
  ADD CONSTRAINT fk_products_vendors FOREIGN KEY (vend_id)
  REFERENCES vendors (vend_id);

-- drop table
DROP TABLE vendors;

-- rename table name
RENAME TABLE backup_customers TO customers;

RENAME TABLE backup_customers TO customers
             backup_vendors TO vendors;
        
  
