# MopoHeatSectorDataProcessing/output

The processed output files are not included in this repository,
as the timeseries especially take up quite some space.
In order to recreate them, simply run the Jupyter notebooks handling the data processing.
However, note that you will need to download the required input data
as detailed in the master README.

Here, we provide a brief description of the produced output files:


## `cop-timeseries/*.csv`

Hourly timeseries for different heat pump coefficients of performance
for different countries, calculated using the
[Mopo AmBIENCE2ABM Demo](https://doi.org/10.5281/zenodo.8238141).
Note that the COP approximation uses a rather crude constant exergy
Carnot method.

Contains 5 weather years:
- `1995`
- `2008`
- `2009`
- `2012`
- `2015`

Contains 8 different COP timeseries:
- `A2AHP-air` space heating using an air-to-air heat pump (`A2AHP`).
- `A2AHP-cooling` space cooling using an air-to-air heat pump.
- `A2WHP-DHW` domestic hot water (`DHW`) heating using an air-to-water heat pump (`A2WHP`).
- `A2WHP-floor` space heating using an air-to-water heat pump assuming a low-temperature heat distribution system (e.g. hydronic floor heating).
- `A2WHP-radiators` space heating using an air-to-water heat pump assuming a medium-temperature heat distribution system (e.g. modern hydronic radiators).
- `G2WHP-DHW` domestic hot water heating using an ground-to-water heat pump (`G2WHP`).
- `G2WHP-floor` space heating using an ground-to-water heat pump assuming a low-temperature heat distribution system (e.g. hydronic floor heating).
- `G2WHP-radiators` space heating using an ground-to-water heat pump assuming a medium-temperature heat distribution system (e.g. modern hydronic radiators).


## `demand-timeseries/*.csv`

Normalised hourly timeseries for the useful energy demand for
space `heating` and `cooling`, as well as domestic hot water (`DHW`) heating
for different countries, calculated using the
[Mopo AmBIENCE2ABM Demo](https://doi.org/10.5281/zenodo.8238141).
The demands are also provided for residential (`res`) and
nonresidential (`nonres`) buildings separately.
Note that the timeseries are rather crude due to the underlying
assumptions and shortcomings of
[ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel).

The timeseries are normalised such that when scaled with a yearly demand in GWh,
the resulting timeseries will represent hourly demand in MW.
Note that in order to preserve the variations in heating/cooling demands between
weather years, the timeseries are normalised using their average yearly demand,
and thus do not sum to 1.
This roughly corresponds to the approach used in the [Hotmaps project](https://www.hotmaps-project.eu/)
when projecting future heating/cooling demand scenarios, where average weather for
2002-2012 was used.


## `heat_storage_technology_params.csv`

Parameters for select heat storage technologies based on the
[Danish Energy Agency technology catalogues](https://ens.dk/en/our-services/technology-catalogues).


## `heating_technology_params.csv`

District heating system and distributed heating technology parameters based on the
[Danish Energy Agency technology catalogues](https://ens.dk/en/our-services/technology-catalogues).


## `peak_to_yearly_demand_ratios_MW_GWh.csv`

Maximum peak heating/cooling demand (MW) to yearly heating/cooling demand (GWh) ratios
accross the modelled weather years, potentially intended to be used for estimating the
peak capacities of heat-only boilers in district heating production across Europe.
Work in progress.


## `scenario_total_yearly_demands_GWh.csv`

Total yearly space heating/cooling and domestic hot water heating demands
based on the [Hotmaps project results](https://gitlab.com/hotmaps?page=1).
To be used 