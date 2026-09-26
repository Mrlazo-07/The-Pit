use housing_project;
create or replace view stddev_calculation
as
SELECT 
province,
stddev(avg_composite/individuals) as affordability_ratio_stddev,
stddev(avg_composite)/avg(avg_composite) as price_cv,
stddev(`housing starts`)/avg(`housing starts`) as starts_cv,
stddev(population)/avg(population) as population_cv
from analysis_table
group by province
order by affordability_ratio_stddev desc