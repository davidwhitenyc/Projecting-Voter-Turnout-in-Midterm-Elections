--create a summary table of county-level 2010 election results
CREATE OR REPLACE TABLE 
`political-data-354221.election_returns.georgia_midterm_general_election_results_by_county_fips_code_2010`  AS

SELECT
precincts.state,	
precincts.county,
--add FIPS code for each county to allow census data to be joined later
county_fips_code,
election_year,	
election_name,	
registered_voters,
ballots_cast


FROM
`political-data-354221.election_returns.georgia_midterm_general_election_results_by_county_2010` precincts


LEFT JOIN 
`political-data-354221.census_data.FIPS_county_codes` fips

ON

precincts.county = fips.county AND precincts.state = fips.us_state_or_territory
;