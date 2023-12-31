---------------------------------------------------------CLEANING-------------------

SELECT distinct languages
FROM RIS_AUTO

select * from RIS_AUTO

select languages,
	case when languages = 'English' then 'English'
	 end as English 
FROM RIS_AUTO


ALTER TABLE RIS_AUTO
ADD English VARCHAR(MAX);

UPDATE RIS_AUTO
SET english = 'English'
WHERE languages LIKE '%English%'


ALTER TABLE RIS_AUTO
ADD Yoruba VARCHAR(MAX);

UPDATE RIS_AUTO
SET Yoruba = 'Yoruba'
WHERE languages LIKE '%Yoruba%'


ALTER TABLE RIS_AUTO
ADD Igbo VARCHAR(MAX);

UPDATE RIS_AUTO
SET Igbo = 'Igbo'
WHERE languages LIKE '%Igbo%'


ALTER TABLE RIS_AUTO
ADD Hausa VARCHAR(MAX);

UPDATE RIS_AUTO
SET Hausa = 'Hausa'
WHERE languages LIKE '%Hausa%'


ALTER TABLE RIS_AUTO
ADD French VARCHAR(MAX);

UPDATE RIS_AUTO
SET French = 'French'
WHERE languages LIKE '%French%'

ALTER TABLE RIS_AUTO
ADD Others VARCHAR(MAX);

UPDATE RIS_AUTO
SET Others = 'Others'
WHERE languages NOT LIKE '%French%'
    AND languages NOT LIKE '%Hausa%'
    AND languages NOT LIKE '%Igbo%'
    AND languages NOT LIKE '%Yoruba%'
    AND languages NOT LIKE '%English%'
	 
WHERE languages LIKE 

select  CUSTOMER_PLAN_ESTIMATE  from RIS_AUTO

select * from RIS_AUTO

select COUNT(PREVIOUS_REMINDER_SOFTWARE) 
from RIS_AUTO
WHERE PREVIOUS_REMINDER_SOFTWARE = 'Yes'

select COUNT(PREVIOUS_REMINDER_SOFTWARE) 
from RIS_AUTO
WHERE PREVIOUS_REMINDER_SOFTWARE = 'No'


select distinct NAME_OF_COMPETITORS  from RIS_AUTO

select COUNT( NAME_OF_COMPETITORS ),  NAME_OF_COMPETITORS
from RIS_AUTO
GROUP BY NAME_OF_COMPETITORS
ORDER BY COUNT( NAME_OF_COMPETITORS ) DESC


select *  from RIS_AUTO




-----------------EXPLORATION--------------
-----LATE PAYMENT------
select count([BUSINESS_CASHFLOW/CUSTOMER_RSHIP]) AS LATE_PAYMENT_ , 
[BUSINESS_CASHFLOW/CUSTOMER_RSHIP]
from RIS_AUTO
group by [BUSINESS_CASHFLOW/CUSTOMER_RSHIP]
order by count([BUSINESS_CASHFLOW/CUSTOMER_RSHIP]) desc


-----LATE PAYMENT/CUSTOMER RELATIONSHIP--------
SELECT 
    COUNT([BUSINESS_CASHFLOW/CUSTOMER_RSHIP]) * 100.0 / SUM(COUNT([BUSINESS_CASHFLOW/CUSTOMER_RSHIP])) OVER() AS LATE_PAYMENT_PERCENTAGE,
    [BUSINESS_CASHFLOW/CUSTOMER_RSHIP]
FROM                                            
    RIS_AUTO
GROUP BY 
    [BUSINESS_CASHFLOW/CUSTOMER_RSHIP]
ORDER BY 
    LATE_PAYMENT_PERCENTAGE DESC;


-----------------PAYMENT CHALLENGES FACED---------
	SELECT * FROM RIS_AUTO

	SELECT COUNT(PAYMENT_CHALLENGES) COUNT_OF_CHALLENGES, 
	PAYMENT_CHALLENGES
	FROM RIS_AUTO
	GROUP BY PAYMENT_CHALLENGES
	ORDER BY COUNT(PAYMENT_CHALLENGES) DESC


	------------------PREVIUOS REMINDER SOFTWARE---------------
	SELECT * FROM RIS_AUTO

	SELECT COUNT(PREVIOUS_REMINDER_SOFTWARE) AS COUNT_OF_REMINDER_SOFTWARES, 
	PREVIOUS_REMINDER_SOFTWARE
	FROM RIS_AUTO
	GROUP BY PREVIOUS_REMINDER_SOFTWARE
	ORDER BY COUNT(PREVIOUS_REMINDER_SOFTWARE) DESC


	----------------------------NAME OF COMPETITORS/EXPERIENCE-----------------
	SELECT * FROM RIS_AUTO

WITH CTE_COMPITI AS (
SELECT [USER-EXPERIENCE_OF_COMPETITORS], NAME_OF_COMPETITORS
FROM RIS_AUTO
WHERE NAME_OF_COMPETITORS IN ('Paper cloud',
'Quickbooks',
'STOCK',
'Wave apps', 
'Wave financial', 
'Xero Accounting',
'Opay',
'Bookipi',
'E Invoicing from FCMB' ,
'Kippa'))
SELECT *
FROM CTE_COMPITI


---------------USERS OF REMINDER SOFTWARE/ FREQUENCY OF USE---------------
SELECT * FROM RIS_AUTO

 ----USERS OF REMINDER SOFTWARE----------
SELECT COUNT(AUTOMATED_RIS)COUNT_OF_RIS_USERS,  AUTOMATED_RIS                  
FROM RIS_AUTO
GROUP BY AUTOMATED_RIS
ORDER BY COUNT(AUTOMATED_RIS) DESC

-------FREQUENCY OF USE--------
SELECT COUNT(REMINDER_FREQUENCY_RIS)COUNT_OF_RIS_FREQUENCY,  
REMINDER_FREQUENCY_RIS               
FROM RIS_AUTO
GROUP BY REMINDER_FREQUENCY_RIS
ORDER BY COUNT(REMINDER_FREQUENCY_RIS) DESC


------------------MULTI-LANGUAGE/PAYMENT GATEWAY/REPORTING AND ANLYTICS---------------
SELECT * FROM RIS_AUTO


	SELECT 
    COUNT(CASE WHEN MULTI_LANGUAGE_FUNCTION = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS PERCENT_OF_MULTI_LANGUAGE,
    COUNT(CASE WHEN PAYMENT_GATEWAY_LINK_FUNCTION = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS PERCENT_OF_PAYMENT_GATEWAY_LINK,
    COUNT(CASE WHEN REPORTING_AND_ANALYTICS = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS PERCENT_OF_REPORTING_AND_ANALYTICS
FROM 
    RIS_AUTO;


--------LANGUAGES ----------------------
--------LANGUAGE CHOSEN -----------------
	SELECT COUNT(YORUBA)                         
	FROM RIS_AUTO;

	SELECT COUNT(IGBO )
	FROM RIS_AUTO;

	SELECT COUNT(HAUSA )
	FROM RIS_AUTO;

	SELECT COUNT(FRENCH )
	FROM RIS_AUTO;


-------SUBSCRIPTION PLANS----------------------

	SELECT COUNT(SUBSCRIPTION_PLANS) COUNT_OF_SUBSCRIPTION, 
	SUBSCRIPTION_PLANS
	FROM RIS_AUTO
	GROUP BY SUBSCRIPTION_PLANS
	ORDER BY COUNT(SUBSCRIPTION_PLANS) DESC
