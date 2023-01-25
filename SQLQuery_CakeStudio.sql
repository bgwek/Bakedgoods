--Explore Data

Select * From Customers
Select * From Orders
Select * From Product

Update Product
Set Product = 'scones'
where Product = 'Dozen scones'


---Clean up data by deleting columns where product ID is null
Delete From Product
Where [Product_ID] is NULL

--find the most popular product
select o.[Product_ Id], product, count(o.[Product_ Id]) as countoforders
from Orders O
Join Product p
on o.[Product_ Id]=p.[Product_ID]
group by o.[Product_ Id], product
order by count(o.[Product_ Id]) desc

--Most popular order in 2020
select o.[Product_ Id], product, count(o.[Product_ Id]) as countoforders,DATEPART(year, [Order Date]) as OrderYear
from Orders O
Join Product p
on o.[Product_ Id]=p.[Product_ID]
where DATEPART(year, [Order Date])=2020
group by o.[Product_ Id], product, DATEPART(year, [Order Date])
order by count(o.[Product_ Id]) desc

--Most popular order in 2021
select o.[Product_ Id], product, count(o.[Product_ Id]) as countoforders,DATEPART(year, [Order Date]) as OrderYear
from Orders O
Join Product p
on o.[Product_ Id]=p.[Product_ID]
where DATEPART(year, [Order Date])=2021
group by o.[Product_ Id], product, DATEPART(year, [Order Date])
order by count(o.[Product_ Id]) desc

--Popular cake flavor
select [Product_ Id], Product_Category, Flavor, product, count(Flavor) as countofflavor
From Orders o
join Product p
On o.[Product_ Id]=p.Product_ID
where Product_Category='cake'
Group by [Product_ Id], Product_Category, Flavor, product
Order by countofflavor desc

--Find customers with the most orders
select c.Customer_ID, count(o.customer_id) as countoforders, City
from Orders o
join Customers c
on o.Customer_Id=c.Customer_ID
Group by c.Customer_ID, City
Order by countoforders desc

--what free gift to send to most recurring customer (1010)
select c.Customer_ID, count(p.Product) as countofproducts, p.product, p.Flavor
from Orders o
join Customers c
on o.Customer_Id=c.Customer_ID
join Product p
on o.[Product_ Id]=p.Product_ID
where c.Customer_ID=1010
Group by c.Customer_ID, p.product, p.Flavor
Order by countofproducts desc

--what free product to send to second most reccuring customer (1008)
select c.Customer_ID, count(p.Product) as countofproducts, p.product, p.Flavor
from Orders o
join Customers c
on o.Customer_Id=c.Customer_ID
join Product p
on o.[Product_ Id]=p.Product_ID
where c.Customer_ID=1008
Group by c.Customer_ID, p.product, p.Flavor
Order by countofproducts desc

--product with the most revenue
select [Product_ Id], sum(Quantity*[Price/Unit]) as Revenue, Product
from Orders o
Join Product p
on o.[Product_ Id]=p.[Product_ID]
group by [Product_ Id], Product
order by Revenue desc

--product with the most revenue by year for 2020
select [Product_ Id], sum(Quantity*[Price/Unit]) as Revenue, Product, 
	DATEPART(year, [Order Date]) as OrderYear
from Orders o
Join Product p
on o.[Product_ Id]=p.[Product_ID]
where DATEPART(year, [Order Date])='2020'
group by [Product_ Id], Product, DATEPART(year, [Order Date])
order by Revenue desc, OrderYear

--product with the most revenue by year for 2021
select [Product_ Id], sum(Quantity*[Price/Unit]) as Revenue, Product, 
	DATEPART(year, [Order Date]) as OrderYear
from Orders o
Join Product p
on o.[Product_ Id]=p.[Product_ID]
where DATEPART(year, [Order Date])='2021'
group by [Product_ Id], Product, DATEPART(year, [Order Date])
order by Revenue desc, OrderYear


--Analysing soccer orders
Declare @Occassion varchar (50)
Set @Occassion='soccer'

select [Product_ Id], sum(Quantity) as Total_Quantity, sum(Quantity*[Price/Unit]) as Revenue, Product
from Orders o
Join Product p
on o.[Product_ Id]=p.[Product_ID]
where Occasion=@Occassion
group by [Product_ Id], Product
order by Revenue desc

--How much product was sold per game per product
select [Product_ Id], sum(quantity) as sum_quanity, Product, [Order Date]
from Orders o
Join Product p
on o.[Product_ Id]=p.[Product_ID]
where Occasion='Soccer'
group by [Product_ Id], Product, [Order Date])

--Average products sold 
select [Product_ Id], avg(quantity) as avg_quanity, p.Product
from Orders o
Join Product p
on o.[Product_ Id]=p.[Product_ID]
where Occasion='Soccer'
group by [Product_ Id], p.Product