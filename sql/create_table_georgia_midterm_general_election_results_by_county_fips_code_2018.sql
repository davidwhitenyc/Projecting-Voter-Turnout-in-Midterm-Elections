--create a summary table of county-level 2018 election results
CREATE OR REPLACE TABLE 
`political-data-354221.election_returns.georgia_midterm_general_election_results_by_county_fips_code_2018`  AS

SELECT
precincts.state,	
precincts.county,
--add FIPS code for each county to allow census data to be joined later
county_fips_code,
election_year,	
election_name,	
SUM(registered_voters) AS registered_voters,
SUM(ballots_cast) AS ballots_cast


FROM
`political-data-354221.election_returns.georgia_midterm_general_election_results_by_precinct_2018` precincts


LEFT JOIN 
`political-data-354221.census_data.FIPS_county_codes` fips

ON

precincts.county = fips.county AND precincts.state = fips.us_state_or_territory

GROUP BY state, county, county_fips_code, election_year, election_name
;