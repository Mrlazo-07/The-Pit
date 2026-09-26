
use housing_project;
CREATE or replace view affordability_table 
as
SELECT province, 
date, 
`housing starts`/population as housing_per_capita,
CASE 
	WHEN avg_composite/individuals <= 3.0 THEN 'Affordable'
    WHEN avg_composite/individuals <= 4.0 THEN 'Moderately affordable'
    WHEN avg_composite/individuals <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as composite_affordability_rating_ind,
CASE
	WHEN avg_single_family/individuals <= 3.0 THEN 'Affordable'
    WHEN avg_single_family/individuals <= 4.0 THEN 'Moderately affordable'
    WHEN avg_single_family/individuals <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as single_family_affordability_rating_ind,
CASE
	WHEN avg_one_storey/individuals <= 3.0 THEN 'Affordable'
    WHEN avg_one_storey/individuals <= 4.0 THEN 'Moderately affordable'
    WHEN avg_one_storey/individuals <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as one_storey_affordability_rating_ind,
CASE
	WHEN avg_two_storey/individuals <= 3.0 THEN 'Affordable'
    WHEN avg_two_storey/individuals <= 4.0 THEN 'Moderately affordable'
    WHEN avg_two_storey/individuals <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as two_storey_affordability_rating_ind,
CASE 
	WHEN avg_townhouse/individuals <= 3.0 THEN 'Affordable'
    WHEN avg_townhouse/individuals <= 4.0 THEN 'Moderately affordable'
    WHEN avg_townhouse/individuals <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as townhouse_affordability_rating_ind,
CASE
	WHEN avg_apartment/individuals <= 3.0 THEN 'Affordable'
    WHEN avg_apartment/individuals <= 4.0 THEN 'Moderately affordable'
    WHEN avg_apartment/individuals <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as apartment_affordability_rating_ind,
CASE 
	WHEN avg_composite/economic_families <= 3.0 THEN 'Affordable'
    WHEN avg_composite/economic_families <= 4.0 THEN 'Moderately affordable'
    WHEN avg_composite/economic_families <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as composite_affordability_rating_fam,
CASE
	WHEN avg_single_family/economic_families <= 3.0 THEN 'Affordable'
    WHEN avg_single_family/economic_families <= 4.0 THEN 'Moderately affordable'
    WHEN avg_single_family/economic_families <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as single_family_affordability_rating_fam,
CASE
	WHEN avg_one_storey/economic_families <= 3.0 THEN 'Affordable'
    WHEN avg_one_storey/economic_families <= 4.0 THEN 'Moderately affordable'
    WHEN avg_one_storey/economic_families <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as one_storey_affordability_rating_fam,
CASE
	WHEN avg_two_storey/economic_families <= 3.0 THEN 'Affordable'
    WHEN avg_two_storey/economic_families <= 4.0 THEN 'Moderately affordable'
    WHEN avg_two_storey/economic_families <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as two_storey_affordability_rating_fam,
CASE 
	WHEN avg_townhouse/economic_families <= 3.0 THEN 'Affordable'
    WHEN avg_townhouse/economic_families <= 4.0 THEN 'Moderately affordable'
    WHEN avg_townhouse/economic_families <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as townhouse_affordability_rating_fam,
CASE
	WHEN avg_apartment/economic_families <= 3.0 THEN 'Affordable'
    WHEN avg_apartment/economic_families <= 4.0 THEN 'Moderately affordable'
    WHEN avg_apartment/economic_families <= 5.0 THEN 'Unaffordable'
    ELSE 'severely unaffordable'
END as apartment_affordability_rating_fam

FROM housing_project.analysis_table;




