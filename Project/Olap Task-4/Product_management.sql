--Product sales 


Create table Sales_sample(Product_Id Integer Primary key, Region varchar(50),date_ Date, Sales_Amount Numeric);


Insert into Sales_sample values (001,'E','06-03-2024',10000),(002,'E','04-08-2024',20000),
(003,'W','02-02-2024',15000),(004,'E','03-04-2024',25000),(005,'N','07-04-2024',9000),
(006,'W','06-04-2024',9500),(007,'S','14-04-2024',10700),(008,'S','26-04-2024',7000),
(009,'E','10-02-2024',2500),(010,'W','05-09-2024',9000);

select region,product_id,sum(sales_amount) as total_sales
from Sales_sample
group bY region,product_id
Order BY region,product_id;

Select Case When Product_Id Is Null Then 'Total' Else Region End As Region,Sum(Sales_Amount) AS total_sales
From sales_sample GROUP BY ROLLUP (Region, Product_Id) ORDER BY Region;

SELECT 
    CASE 
        WHEN Product_Id IS NULL AND Region IS NULL AND Date_ IS NULL THEN 'Total'
        WHEN Product_Id IS NULL AND Region IS NULL THEN 'Total by Date'
        WHEN Product_Id IS NULL AND Date_ IS NULL THEN 'Total by Region'
        WHEN Region IS NULL AND Date_ IS NULL THEN 'Total by Product'
        WHEN Product_Id IS NULL THEN 'Total by Region, Date'
        WHEN Region IS NULL THEN 'Total by Product, Date'
        WHEN Date_ IS NULL THEN 'Total by Product, Region'
        ELSE 'Detail'
    END AS Perspective,
    Product_Id,
    Region,
    Date_,
    SUM(Sales_Amount) AS total_sales
FROM 
    sales_sample
GROUP BY 
    CUBE (Product_Id, Region, Date_)
ORDER BY 
    Product_Id, Region, Date_;

Select * From Sales_sample Where Region = 'E' and Date_ Between '06-03-2024' and '10-11-2024'


SELECT 
    Product_Id,
    Region,
    Date_,
    SUM(Sales_Amount) AS total_sales
FROM 
    sales_sample
WHERE
    Product_Id = '105' AND
    Region = 'N' AND
    Date_ = '07-04-2024'
GROUP BY 
    Product_Id, Region, Date_;
