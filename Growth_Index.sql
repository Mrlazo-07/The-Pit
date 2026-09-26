CREATE OR REPLACE VIEW growth_index AS
SELECT province, date,
    (avg_composite / FIRST_VALUE(avg_composite) OVER (PARTITION BY province ORDER BY date)) * 100 as price_index,
    (individuals / FIRST_VALUE(individuals) OVER (PARTITION BY province ORDER BY date)) * 100 as income_index
FROM analysis_table;