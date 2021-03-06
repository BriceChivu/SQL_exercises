-- Find the minimum, average, and maximum rental price for each review qualification category.
-- The review qualification category is a classification applied to each rental property based on the number of reviews the property has. It is defined as below.
-- 0 reviews: NO
-- 1 to 5 reviews: FEW
-- 6 to 15 reviews: SOME
-- 16 to 40 reviews: MANY
-- more than 40 reviews: A LOT

-- Video explicative here: https://www.youtube.com/watch?v=qH7rq7p8N5s&ab_channel=TinaHuang 


-- Solution:

select category, min(price), avg(price), max(price)
from(
	select *, 
	case 
		when number_of_reviews =0 then 'NO'
		when number_of_reviews BETWEEN 1 AND 5 then 'FEW'
		when number_of_reviews BETWEEN 6 AND 15 then 'SOME'
		when number_of_reviews BETWEEN 16 AND 40 then 'MANY'
		else 'A LOT' end as category 
	from airbnb
) as tmp
group by category
