------------++++++++++++++2018 Census++++++++++++++++++++++++++++++--------------------------
SELECT

--the first 5 characters of the geo_id indicate the county's FIPS code
LEFT (geo_id, 5) AS county_fips,

--specify the census year to allow for joining other tables by year later
'2018' AS census_year,

--select race data
ROUND (SUM(white_pop) / SUM(total_pop),3) AS white_pct,
ROUND (SUM(black_pop) / SUM(total_pop),3) AS black_pct,
ROUND (SUM(hispanic_pop) / SUM(total_pop),3) AS hispanic_pct,
ROUND (SUM(asian_pop) / SUM(total_pop),3) AS asian_pct,
ROUND (SUM(amerindian_pop) / SUM(total_pop),3) AS amerindian_pct,
ROUND (SUM(other_race_pop) / SUM(total_pop),3) AS other_race_pct,


--select gender data
ROUND (SUM(male_pop) / SUM(total_pop),3) AS male_pct,
ROUND (SUM(female_pop) / SUM(total_pop),3) AS female_pct,


--select age data
--population ages 0 to 17
ROUND((SUM(male_under_5) + SUM(female_under_5) +
SUM(male_5_to_9) + SUM(female_5_to_9) +
SUM(male_10_to_14) + SUM(female_10_to_14) +
SUM(male_15_to_17) + SUM(female_15_to_17) ) / SUM(total_pop),3) AS under_age_18_pct ,

--population ages 18 to 24
ROUND((SUM(male_18_to_19) + SUM(female_18_to_19) + 
SUM(male_20) + SUM(female_20) +
SUM(male_21) + SUM(female_21) +
SUM(male_22_to_24) + SUM(female_22_to_24) ) / SUM(total_pop),3) AS ages_18_to_24_pct ,

--population ages 25 to 39
ROUND((SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) ) / SUM(total_pop),3) AS ages_25_to_39_pct ,

--population ages 40 to 64
ROUND((SUM(male_40_to_44) + SUM(female_40_to_44) + 
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_to_61) + SUM(female_60_to_61) +
SUM(male_62_to_64) + SUM(female_62_to_64) ) / SUM(total_pop),3) AS ages_40_to_64_pct ,

--population ages 65 and over
ROUND((SUM(male_65_to_66) + SUM(female_65_to_66) + 
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over) ) / SUM(total_pop),3) AS ages_65_and_over_pct ,


--select education data
--percentage of adults 25 or older who's highest level of education is a high school diploma
ROUND (SUM(high_school_diploma) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_to_61) + SUM(female_60_to_61) +
SUM(male_62_to_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_high_school_diploma_pct,

--percentage of adults 25 or older who's highest level of education is a bachelor's degree
ROUND (SUM(bachelors_degree) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_to_61) + SUM(female_60_to_61) +
SUM(male_62_to_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_bachelors_degree_pct,

--percentage of adults 25 or older who's highest level of education is a master's degree
ROUND (SUM(masters_degree) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_to_61) + SUM(female_60_to_61) +
SUM(male_62_to_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_masters_degree_pct,


--select household income data
--household income less than $20,000
ROUND((SUM(income_less_10000) + 
SUM(income_10000_14999) +
SUM(income_15000_19999)) / SUM(households),3) AS household_income_less_than_10k_pct ,

--household income between $20,000 and $39,999
ROUND((SUM(income_20000_24999) + 
SUM(income_25000_29999) +
SUM(income_30000_34999) +
SUM(income_35000_39999)) / SUM(households),3) AS household_income_20_to_40k_pct ,

--household income between $40,000 and $59,999
ROUND((SUM(income_40000_44999) + 
SUM(income_45000_49999) +
SUM(income_50000_59999)) / SUM(households),3) AS household_income_40_to_60k_pct ,

--household income between $60,000 and $99,999
ROUND((SUM(income_60000_74999) + 
SUM(income_75000_99999)) / SUM(households),3) AS income_60_to_100k_pct ,

--household income between $100,000 and $199,999
ROUND((SUM(income_100000_124999) + 
SUM(income_125000_149999) +
SUM(income_150000_199999)) / SUM(households),3) AS household_income_100_to_200k_pct ,

--household income between $200,000 or more
ROUND(SUM(income_200000_or_more) / SUM(households),3) AS household_income_200k_or_more_pct ,

--select overall poverty rate
ROUND(SUM(poverty) / SUM(total_pop),3) AS poverty_pct ,


--select household attributes data
ROUND(SUM(families_with_young_children) / SUM(family_households),3) AS families_with_young_children_pct ,

ROUND(SUM(married_households) / SUM(households),3) AS married_households_pct ,

--select transpotation data
ROUND(SUM(commuters_by_public_transportation) / SUM(employed_pop),3) AS commuters_by_public_transportation_pct ,

ROUND(SUM(no_cars) / SUM(households),3) AS households_without_a_car_pct ,



FROM `bigquery-public-data.census_bureau_acs.censustract_2018_5yr` census_18



--the first two characters of the geo_1d indicate the state's FIPS code
--limit the results to census tracts within the state of Georgia
WHERE LEFT(geo_id, 2) = '13'



--group the results by county
GROUP BY county_fips
 ;

-------------




------------++++++++++++++2014 Census++++++++++++++++++++++++++++++--------------------------
SELECT

--the first 5 characters of the geo_id indicate the county's FIPS code
LEFT (geo_id, 5) AS county_fips,

--specify the census year to allow for joining other tables by year later
'2014' AS census_year,

--select race data
ROUND (SUM(white_pop) / SUM(total_pop),3) AS white_pct,
ROUND (SUM(black_pop) / SUM(total_pop),3) AS black_pct,
ROUND (SUM(hispanic_pop) / SUM(total_pop),3) AS hispanic_pct,
ROUND (SUM(asian_pop) / SUM(total_pop),3) AS asian_pct,
ROUND (SUM(amerindian_pop) / SUM(total_pop),3) AS amerindian_pct,
ROUND (SUM(other_race_pop) / SUM(total_pop),3) AS other_race_pct,


--select gender data
ROUND (SUM(male_pop) / SUM(total_pop),3) AS male_pct,
ROUND (SUM(female_pop) / SUM(total_pop),3) AS female_pct,


--select age data
--population ages 0 to 17
ROUND((SUM(male_under_5) + SUM(female_under_5) +
SUM(male_5_to_9) + SUM(female_5_to_9) +
SUM(male_10_to_14) + SUM(female_10_to_14) +
SUM(male_15_to_17) + SUM(female_15_to_17) ) / SUM(total_pop),3) AS under_age_18_pct ,

--population ages 18 to 24
ROUND((SUM(male_18_to_19) + SUM(female_18_to_19) + 
SUM(male_20) + SUM(female_20) +
SUM(male_21) + SUM(female_21) +
SUM(male_22_to_24) + SUM(female_22_to_24) ) / SUM(total_pop),3) AS ages_18_to_24_pct ,

--population ages 25 to 39
ROUND((SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) ) / SUM(total_pop),3) AS ages_25_to_39_pct ,

--population ages 40 to 64
ROUND((SUM(male_40_to_44) + SUM(female_40_to_44) + 
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_61) + SUM(female_60_to_61) +
SUM(male_62_64) + SUM(female_62_to_64) ) / SUM(total_pop),3) AS ages_40_to_64_pct ,

--population ages 65 and over
ROUND((SUM(male_65_to_66) + SUM(female_65_to_66) + 
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over) ) / SUM(total_pop),3) AS ages_65_and_over_pct ,


--select education data
--percentage of adults 25 or older who's highest level of education is a high school diploma
ROUND (SUM(high_school_diploma) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_61) + SUM(female_60_to_61) +
SUM(male_62_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_high_school_diploma_pct,

--percentage of adults 25 or older who's highest level of education is a bachelor's degree
ROUND (SUM(bachelors_degree) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_61) + SUM(female_60_to_61) +
SUM(male_62_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_bachelors_degree_pct,

--percentage of adults 25 or older who's highest level of education is a master's degree
ROUND (SUM(masters_degree) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_61) + SUM(female_60_to_61) +
SUM(male_62_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_masters_degree_pct,


--select household income data
--household income less than $20,000
ROUND((SUM(income_less_10000) + 
SUM(income_10000_14999) +
SUM(income_15000_19999)) / SUM(households),3) AS household_income_less_than_10k_pct ,

--household income between $20,000 and $39,999
ROUND((SUM(income_20000_24999) + 
SUM(income_25000_29999) +
SUM(income_30000_34999) +
SUM(income_35000_39999)) / SUM(households),3) AS household_income_20_to_40k_pct ,

--household income between $40,000 and $59,999
ROUND((SUM(income_40000_44999) + 
SUM(income_45000_49999) +
SUM(income_50000_59999)) / SUM(households),3) AS household_income_40_to_60k_pct ,

--household income between $60,000 and $99,999
ROUND((SUM(income_60000_74999) + 
SUM(income_75000_99999)) / SUM(households),3) AS income_60_to_100k_pct ,

--household income between $100,000 and $199,999
ROUND((SUM(income_100000_124999) + 
SUM(income_125000_149999) +
SUM(income_150000_199999)) / SUM(households),3) AS household_income_100_to_200k_pct ,

--household income between $200,000 or more
ROUND(SUM(income_200000_or_more) / SUM(households),3) AS household_income_200k_or_more_pct ,

--select overall poverty rate
ROUND(SUM(poverty) / SUM(total_pop),3) AS poverty_pct ,


--select household attributes data
ROUND(SUM(families_with_young_children) / SUM(family_households),3) AS families_with_young_children_pct ,

ROUND(SUM(married_households) / SUM(households),3) AS married_households_pct ,

--select transpotation data
ROUND(SUM(commuters_by_public_transportation) / SUM(employed_pop),3) AS commuters_by_public_transportation_pct ,

ROUND(SUM(no_cars) / SUM(households),3) AS households_without_a_car_pct ,



FROM `bigquery-public-data.census_bureau_acs.censustract_2014_5yr` census_14



--the first two characters of the geo_1d indicate the state's FIPS code
--limit the results to census tracts within the state of Georgia
WHERE LEFT(geo_id, 2) = '13'



--group the results by county
GROUP BY county_fips
 ;

-------------



------------++++++++++++++2010 Census++++++++++++++++++++++++++++++--------------------------
SELECT

--the first 5 characters of the geo_id indicate the county's FIPS code
LEFT (geo_id, 5) AS county_fips,

--specify the census year to allow for joining other tables by year later
'2010' AS census_year,

--select race data
ROUND (SUM(white_pop) / SUM(total_pop),3) AS white_pct,
ROUND (SUM(black_pop) / SUM(total_pop),3) AS black_pct,
ROUND (SUM(hispanic_pop) / SUM(total_pop),3) AS hispanic_pct,
ROUND (SUM(asian_pop) / SUM(total_pop),3) AS asian_pct,
ROUND (SUM(amerindian_pop) / SUM(total_pop),3) AS amerindian_pct,
ROUND (SUM(other_race_pop) / SUM(total_pop),3) AS other_race_pct,


--select gender data
ROUND (SUM(male_pop) / SUM(total_pop),3) AS male_pct,
ROUND (SUM(female_pop) / SUM(total_pop),3) AS female_pct,


--select age data
--population ages 0 to 17
ROUND((SUM(male_under_5) + SUM(female_under_5) +
SUM(male_5_to_9) + SUM(female_5_to_9) +
SUM(male_10_to_14) + SUM(female_10_to_14) +
SUM(male_15_to_17) + SUM(female_15_to_17) ) / SUM(total_pop),3) AS under_age_18_pct ,

--population ages 18 to 24
ROUND((SUM(male_18_to_19) + SUM(female_18_to_19) + 
SUM(male_20) + SUM(female_20) +
SUM(male_21) + SUM(female_21) +
SUM(male_22_to_24) + SUM(female_22_to_24) ) / SUM(total_pop),3) AS ages_18_to_24_pct ,

--population ages 25 to 39
ROUND((SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) ) / SUM(total_pop),3) AS ages_25_to_39_pct ,

--population ages 40 to 64
ROUND((SUM(male_40_to_44) + SUM(female_40_to_44) + 
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_61) + SUM(female_60_to_61) +
SUM(male_62_64) + SUM(female_62_to_64) ) / SUM(total_pop),3) AS ages_40_to_64_pct ,

--population ages 65 and over
ROUND((SUM(male_65_to_66) + SUM(female_65_to_66) + 
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over) ) / SUM(total_pop),3) AS ages_65_and_over_pct ,


--select education data
--percentage of adults 25 or older who's highest level of education is a high school diploma
ROUND (SUM(high_school_diploma) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_61) + SUM(female_60_to_61) +
SUM(male_62_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_high_school_diploma_pct,

--percentage of adults 25 or older who's highest level of education is a bachelor's degree
ROUND (SUM(bachelors_degree) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_61) + SUM(female_60_to_61) +
SUM(male_62_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_bachelors_degree_pct,

--percentage of adults 25 or older who's highest level of education is a master's degree
ROUND (SUM(masters_degree) / 
(SUM(male_25_to_29) + SUM(female_25_to_29) + 
SUM(male_30_to_34) + SUM(female_30_to_34) +
SUM(male_35_to_39) + SUM(female_35_to_39) +
SUM(male_40_to_44) + SUM(female_40_to_44) +
SUM(male_45_to_49) + SUM(female_45_to_49) +
SUM(male_50_to_54) + SUM(female_50_to_54) +
SUM(male_55_to_59) + SUM(female_55_to_59) +
SUM(male_60_61) + SUM(female_60_to_61) +
SUM(male_62_64) + SUM(female_62_to_64) +
SUM(male_65_to_66) + SUM(female_65_to_66) +
SUM(male_67_to_69) + SUM(female_67_to_69) +
SUM(male_70_to_74) + SUM(female_70_to_74) +
SUM(male_75_to_79) + SUM(female_75_to_79) +
SUM(male_80_to_84) + SUM(female_80_to_84) +
SUM(male_85_and_over) + SUM(female_85_and_over)),3) AS highest_edudation_level_masters_degree_pct,


--select household income data
--household income less than $20,000
ROUND((SUM(income_less_10000) + 
SUM(income_10000_14999) +
SUM(income_15000_19999)) / SUM(households),3) AS household_income_less_than_10k_pct ,

--household income between $20,000 and $39,999
ROUND((SUM(income_20000_24999) + 
SUM(income_25000_29999) +
SUM(income_30000_34999) +
SUM(income_35000_39999)) / SUM(households),3) AS household_income_20_to_40k_pct ,

--household income between $40,000 and $59,999
ROUND((SUM(income_40000_44999) + 
SUM(income_45000_49999) +
SUM(income_50000_59999)) / SUM(households),3) AS household_income_40_to_60k_pct ,

--household income between $60,000 and $99,999
ROUND((SUM(income_60000_74999) + 
SUM(income_75000_99999)) / SUM(households),3) AS income_60_to_100k_pct ,

--household income between $100,000 and $199,999
ROUND((SUM(income_100000_124999) + 
SUM(income_125000_149999) +
SUM(income_150000_199999)) / SUM(households),3) AS household_income_100_to_200k_pct ,

--household income between $200,000 or more
ROUND(SUM(income_200000_or_more) / SUM(households),3) AS household_income_200k_or_more_pct ,

--select overall poverty rate
ROUND(SUM(poverty) / SUM(total_pop),3) AS poverty_pct ,


--select household attributes data
ROUND(SUM(families_with_young_children) / SUM(family_households),3) AS families_with_young_children_pct ,

ROUND(SUM(married_households) / SUM(households),3) AS married_households_pct ,

--select transpotation data
ROUND(SUM(commuters_by_public_transportation) / SUM(employed_pop),3) AS commuters_by_public_transportation_pct ,

ROUND(SUM(no_cars) / SUM(households),3) AS households_without_a_car_pct ,



FROM `bigquery-public-data.census_bureau_acs.censustract_2010_5yr` census_10



--the first two characters of the geo_1d indicate the state's FIPS code
--limit the results to census tracts within the state of Georgia
WHERE LEFT(geo_id, 2) = '13'



--group the results by county
GROUP BY county_fips
 ;

-------------























































