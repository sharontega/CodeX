---------------
#----Code basis challenge CodeX
------------------
#Author:sharon omovie
#tool used: mysql workbench
----------------------
#1a Who prefers energy drink more?  (male/female/non-binary?) 
select Gender,count(Gender) count
from respondent
group by Gender
order by count desc;

#1b Which age group prefers energy drinks more? 
select Age, count(Age) count
from respondent
group by Age
order by count desc;

#1c. Which type of marketing reaches the most Youth (15-30)?
with a as(
select age,r.Marketing_channels, count(r.Marketing_channels) count_marketing
from responses r
join respondent s
on r.Respondent_ID=s.Respondent_ID
where age between 15 and 30 
group by age,Marketing_channels
order by age asc,count_marketing desc)
select age, Marketing_channels,count_marketing
from a
group by age;

#2a.What are the preferred ingredients of energy drinks among respondents? 
select distinct(Ingredients_expected)
from responses;

#2b.What packaging preferences do respondents have for energy drinks? 
select distinct(Packaging_preference)
from responses;

#3a. Who are the current market leaders?
select Current_brands, count(Current_brands) count
from responses
group by Current_brands
order by count desc;

#3b.What are the primary reasons consumers prefer those brands over ours?
select distinct(Reasons_for_choosing_brands)
from responses;

#4a. Which marketing channel can be used to reach more customers?
select Marketing_channels,count(Marketing_channels) count
from responses
group by Marketing_channels;

#4b. How effective are different marketing strategies and channels in reaching our customers? 
select Marketing_channels,count(Marketing_channels) count
from responses
where Current_brands='CodeX'
group by Marketing_channels;

#5a What do people think about our brand? (overall rating) 
select Brand_perception, count(Brand_perception) count
from responses
group by Brand_perception
limit 1;

#5bWhich cities do we need to focus more on?
select city,
sum(case when Heard_before = 'Yes' then 1
else 0
end) count_yes,
sum(case when Heard_before = 'no' then 1
else 0
end) count_No
from responses rr
join respondent r using(Respondent_ID)
join dim_cities c using(city_id)
group by City_ID
order by count_No desc;


#6aWhere do respondents prefer to purchase energy drinks?
select distinct(Purchase_location),count(Purchase_location) count
from responses
group by Purchase_location;

#6b What are the typical consumption situations for energy drinks among respondents? 
select distinct(Typical_consumption_situations)
from responses;

#7a. Which area of business should we focus more on our product development? (Branding/taste/availability
select Reasons_preventing_trying, count(Reasons_preventing_trying) count
from responses
group by Reasons_preventing_trying
order by count desc;

#target audience
select distinct(age), count(age) count
from respondent
group by age;

#ideal price
select distinct(Price_range), count(Price_range) count
from responses
group by Price_range
order by count desc;

#-----------------------------------------------------
#1. Demographic Insights (examples) 
  #a. Who prefers energy drink more?  (male/female/non-binary?) 
  #b. Which age group prefers energy drinks more? 
  #c. Which type of marketing reaches the most Youth (15-30)?  
#2. Consumer Preferences: 
  #a. What are the preferred ingredients of energy drinks among respondents? 
  #b. What packaging preferences do respondents have for energy drinks?  
#3. Competition Analysis: 
  #a. Who are the current market leaders? 
  #b. What are the primary reasons consumers prefer those brands over ours?  
#4. Marketing Channels and Brand Awareness: 
  #a. Which marketing channel can be used to reach more customers? 
  #b. How effective are different marketing strategies and channels in reaching our customers?  
#5. Brand Penetration: 
  #a. What do people think about our brand? (overall rating) 
  #b. Which cities do we need to focus more on?  
#6. Purchase Behavior: 
  #a. Where do respondents prefer to purchase energy drinks? 
  #b. What are the typical consumption situations for energy drinks among respondents?
#7. Product Development 
  #a. Which area of business should we focus more on our product development? (Branding/taste/availability)      