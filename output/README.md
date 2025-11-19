# MopoHeatSectorDataProcessing/output

Output produced by [MopoHeatSectorDataProcessing](https://github.com/spine-tools/MopoHeatSectorDataProcessing).

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

Produced by `cop_export.ipynb` with more details on how the data is reorganized from the raw [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) output.


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

Produced by `demand_scaling.ipynb` with more details on how the demand timeseries are processed from the raw [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) output.


## `heat_storage_technology_params.csv`

Parameters for select heat storage technologies based on the
[Danish Energy Agency technology catalogues](https://ens.dk/en/our-services/technology-catalogues).

Produced by `process_storage_data.ipynb` with more details on how the DEA data is mapped, aggregated, and processed into the desired technology parameters.


## `heating_technology_params.csv`

District heating system and distributed heating technology parameters based on the
[Danish Energy Agency technology catalogues](https://ens.dk/en/our-services/technology-catalogues).

Produced by `process_generation_data.ipynb` with more details on how the DEA data is mapped, aggregated, and processed into the desired technology parameters.


## `peak_to_yearly_demand_ratios_MW_GWh.csv`

Maximum peak heating/cooling demand (MW) to yearly heating/cooling demand (GWh) ratios across the modelled weather years.
Used for estimating the capacities of both distributed heating systems as well as heat-only boilers in district heating production across Europe.

Produced by `demand_scaling.ipynb` with more details on how these are calculated based on the raw [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) output.


## `scenario_estimated_existing_capacities_MW.csv`

Estimated heating/cooling technology capacities in MW based on the [Hotmaps project results](https://gitlab.com/hotmaps?page=1) as well as the peak-to-yearly-demand ratios of the [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) output.
Essentially just multiplies the yearly demand by the estimated peak demand for distributed heating capacities.
District heating heat-only boiler capacities estimated based on fuel distributions in the [JRC-IDEES](http://data.europa.eu/89h/82322924-506a-4c9a-8532-2bdd30d69bf5) 2015 (for UK only) and 2021 datasets.

NOTE! The existing heating capacities of the heat pumps are pretty volatile, as the `Electricity` vs `ambient heat` ratios in the Hotmaps data is all over the place.
For most cases this is hopefully ok, but for some rows the estimated COP reaches hundreds and thousands, which is unrealistic.
Quirks of statistics, I suppose.

Produced by `process_capacity_data.ipynb` with more details on how the capacities are mapped and estimated.



## `scenario_total_yearly_demands_GWh.csv`

Total yearly space heating/cooling and domestic hot water heating demands
based on the [Hotmaps project results](https://gitlab.com/hotmaps?page=1).
These are used to scale the heating/cooling demand profiles to match a desired yearly scenario demand.

NOTE! While Norway and Switzerland are included, they don't have real scenario data in the Hotmaps results.
Instead, their demands are based on neighbouring countries and scaled based on population.

Produced by `demand_scaling.ipynb` with more details on how the Hotmaps data is extended, aggregated, and aggregated.


## `simplified_capacities_with_decommissioning_MW.csv`

Further processed simplified existing capacities from `scenario_estimated_existing_capacities_MW` for Mopo WP5.
Unlike the aforementioned file,
the future capacities here are not based on the [Hotmaps project results](https://gitlab.com/hotmaps?page=1) except for the first year.
Instead, the capacities for the remaining years are estimated based on approximate decommissioning rates calculated from the `lifetime_y` parameter in the `heating_technology_params.csv`.

Also note that these capacities are totals over the `building_category` and heating/DHW `demand`.
`demand_category` and cooling `demand` are still separate due to different `technology` serving them.
The `scenario` is currently selected as `current`.

Produced by `process_capacity_data.ipynb`.