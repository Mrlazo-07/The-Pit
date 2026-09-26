use housing_project;
create view analysis_table as
select i.date, 
	i.province,
	pp.population, 
	i.economic_families, 
	i.individuals,
	h.`housing starts`,
	h.`housing under construction`,
	h.`housing completions`,
		Round(s.avg_composite, 0) as avg_composite,
		Round(s.avg_single_family, 0) as avg_single_family,
		Round(s.avg_one_storey, 0) as avg_one_storey,
		Round(s.avg_two_storey, 0) as avg_two_storey,
		Round(s.avg_townhouse, 0) as avg_townhouse,
		Round(s.avg_apartment, 0) as avg_apartment
from income_by_province i
	join pop_by_province pp using (province, date)
	join housing_construction h using (province, date)
	join (select 
		year(date) as date,
			province, 
			avg(composite) as avg_composite,
			avg(townhouse) as avg_townhouse,
			avg(single_family) as avg_single_family,
			avg(one_storey) as avg_one_storey,
			avg(two_storey) as avg_two_storey,
			avg(apartment) as avg_apartment
	from housing_prices
	group by year(date), province
		) s using (province, date)

