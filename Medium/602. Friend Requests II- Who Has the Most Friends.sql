-- In social network like Facebook or Twitter, people send friend requests and accept others' requests as well.
--  

-- Table request_accepted holds the data of friend acceptance, while requester_id and accepter_id both are the id of a person.
--  

-- | requester_id | accepter_id | accept_date|
-- |--------------|-------------|------------|
-- | 1            | 2           | 2016_06-03 |
-- | 1            | 3           | 2016-06-08 |
-- | 2            | 3           | 2016-06-08 |
-- | 3            | 4           | 2016-06-09 |
-- Write a query to find the the people who has most friends and the most friends number. For the sample data above, the result is:
-- | id | num |
-- |----|-----|
-- | 3  | 3   |
-- Note:
-- It is guaranteed there is only 1 people having the most friends.
-- The friend request could only been accepted once, which mean there is no multiple records with the same requester_id and accepter_id value.


drop table if exists request_accepted;
drop table if exists result;

CREATE TABLE request_accepted (
  `requester_id` INTEGER,
  `accepter_id` INTEGER,
  `accept_date` VARCHAR(10)
);

INSERT INTO request_accepted
  (`requester_id`, `accepter_id`, `accept_date`)
VALUES
  ('1', '2', '2016_06-03'),
  ('1', '3', '2016-06-08'),
  ('2', '3', '2016-06-08'),
  ('3', '4', '2016-06-09');

CREATE TABLE Result (
  `id` INTEGER,
  `num` INTEGER
);

INSERT INTO Result
  (`id`, `num`)
VALUES
  ('3', '3');
  

select id, count(id) as num
from(
select requester_id as id
from request_accepted
union all
select accepter_id as id
from request_accepted) as cte
group by id
order by num desc
limit 1;