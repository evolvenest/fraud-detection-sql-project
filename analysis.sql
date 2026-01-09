CREATE DATABASE fraud_detection;
USE fraud_detection;
CREATE TABLE info(
id INT,
name VARCHAR(100),
type_of_attack VARCHAR(100),
amount_loss INT,
place VARCHAR(100)
);
#this shows all the data 
SELECT * FROM info; 
#total number of fraud cases
SELECT count(distinct type_of_attack) AS total_attack_types
 FROM info;
 #attck type
 SELECT distinct type_of_attack from info;
#number of cases for each type of attack
SELECT type_of_attack ,count(*) as total_cases from info 
group by type_of_attack
order by total_cases desc;
#total financial loss in each attack type
SELECT type_of_attack,
sum(amount_loss) as total_loss
from info
group by type_of_attack
order by total_loss desc
limit 3;
# total loss by place
select place,
sum(amount_loss) as total_loss
from info
group by place
order by total_loss desc
limit 2;
#rank types of attack based on loss
select type_of_attack,
sum(amount_loss)as total_loss ,
rank()over (order by sum(amount_loss)desc) as risk_ranks
from info
group by type_of_attack;


