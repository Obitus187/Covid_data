-- Aggregating data by Country and doing some calculations such as fully vaccinated divided by country's population

SELECT country_name, sum(new_confirmed) as Confirmed, sum(new_deceased) as Deceased, sum(new_persons_fully_vaccinated) as Vaccinated, (sum(new_persons_fully_vaccinated)/max(population)) as Percent_Vaxed, max(population) as population, sum(new_confirmed_male) as male_confirmed, sum(new_deceased_male) as male_deceased, sum(new_confirmed_female) as female_confirmed, sum(new_deceased_female) as femaled_deceased, (sum(new_confirmed_male)/sum(new_confirmed)) as percent_male_confirmed, (sum(new_confirmed_female)/sum(new_confirmed)) as percent_female_confirmed
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
group by country_name
order by population desc
LIMIT 1000

-- Creating a table for daily data updates

SELECT date, country_name, new_confirmed, new_deceased, cumulative_confirmed, cumulative_deceased, new_persons_vaccinated, cumulative_persons_vaccinated, new_persons_fully_vaccinated, cumulative_persons_fully_vaccinated, stringency_index, average_temperature_celsius, rainfall_mm, snowfall_mm
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
order by date
