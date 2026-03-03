# MopoHeatSectorDataProcessing/output

Output produced by [MopoHeatSectorDataProcessing](https://github.com/spine-tools/MopoHeatSectorDataProcessing).

The processed output files are not included in this repository,
as the timeseries especially take up quite some space.
Instead, they are archived in [Zenodo](https://doi.org/10.5281/zenodo.18253755).
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

The data is organized into multiple `.csv` files over the weather year and the nature of the timeseries.

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

The data inside each .csv files is organized into the following columns:
- `timestamp` for the point in time of the data.
- `<country>` columns containing data for their respective countries.

Produced by `cop_export.ipynb` with more details on how the data is reorganized from the raw [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) output.


## `demand-timeseries/*.csv`

Normalised hourly timeseries for the useful energy demand for
space `heating` and `cooling`, as well as domestic hot water (`DHW`) heating
for different countries, calculated using the
[Mopo AmBIENCE2ABM Demo](https://doi.org/10.5281/zenodo.8238141).
Note that the timeseries are rather crude due to the underlying
assumptions and shortcomings of
[ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel).

The data is organized into multiple `.csv` files based on demand categories:

The first demand category distinguishes between:
- `cooling` for space cooling demand.
- `DHW` for domestic hot water demand.
- `heating` for space heating demand.

The second category distinguishes between residential and non-residential buildings:
- `res` stands for residential buildings.
- `nonres` stands for non-residential buildings.

The data inside each .csv files is organized into the following columns:
- `timestamp` for the point in time of the data.
- `<country>` columns containing data for their respective countries.

The timeseries are normalised such that when scaled with a yearly demand in GWh,
the resulting timeseries will represent hourly demand in MW.
Note that in order to preserve the variations in heating/cooling demands between
weather years, the timeseries are normalised using their average yearly demand,
and thus do not sum to 1.
This roughly corresponds to the approach used in the [Hotmaps project](https://www.hotmaps-project.eu/)
when projecting future heating/cooling demand scenarios, where average weather for
2002-2012 was used.

Produced by `demand_scaling.ipynb` with more details on how the demand timeseries are processed from the raw [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) output.


## `heat_storage_params.csv`

Parameters for select heat storage technologies based on the
[Danish Energy Agency technology catalogues](https://ens.dk/en/our-services/technology-catalogues).

The data contains the following columns:
- `technology` identifies the technology in question.
- `to_node` indicates the output commodity used in the case studies in Mopo WP5. `DH` stands for district heating, while `heat` means distributed heating.
- `year` the technology parameters aim to depict.
- `CAPEX_energy_MEUR_GWh` is the CAPEX cost in terms of storage energy capacity in [MEUR/GWh].
- `FOM_energy_EUR_GWh_y` is the fixed operations and maintenance costs in terms of storage energy capacity in [EUR/GWh/y].
- `VOM_EUR_MWh` is the variable operations and maintenance costs in [EUR/MWh].
- `charge_efficiency_pu` is the charging efficiency per unit (0-1).
- `discharge_efficiency_pu` is the discahrging efficiency per unit (0-1).
- `energy_to_power_ratio_h` is the ratio between the storage energy content to its input/output power in [h].
- `storage_losses_pu_day` are the self-discharge losses per unit (0-1) per day.
- `lifetime_y` is the lifetime in years.
- `currency` denotes the year of the currency used.
- `metadata` provides details on the original raw data source.

Produced by `process_storage_data.ipynb` with more details on how the DEA data is mapped, aggregated, and processed into the desired technology parameters.


## `heat_technology_params.csv`

District heating system and distributed heating technology parameters based on the
[Danish Energy Agency technology catalogues](https://ens.dk/en/our-services/technology-catalogues).

The data contains the following columns:
- `technology` identifies the technology in question.
- `from_node` indicates the input commodity used in the Mopo WP5 case studies.
- `to_node` indicates the output commodity used in the case studies in Mopo WP5.
- `year` the technology parameters aim to depict.
- `CAPEX_MEUR_MW` is the CAPEX in terms of power [MEUR/MW].
- `FOM_EUR_MW_y` is the fixed operations and maintenance costs in terms of power [EUR/MW/y].
- `VOM_EUR_MWh` is the variable operations and maintenance costs in [EUR/MWh].
- `lifetime_y` is the lifetime in years.
- `conversion_rate_elec_pu` is the conversion efficiency to electricity per unit (0-1).
- `conversion_rate_heat_pu` is the conversion efficiency to district heat per unit (0-1).
- `CO2_captured_pu` is the carbon capture rate per unit (0-1).
- `currency` denotes the year of the currency used.
- `metadata` provides details on the original raw data source.

Produced by `process_generation_data.ipynb` with more details on how the DEA data is mapped, aggregated, and processed into the desired technology parameters.


## `peak_to_yearly_demand_ratios_MW_GWh.csv`

Maximum peak heating/cooling demand (MW) to yearly heating/cooling demand (GWh) ratios across the modelled weather years.
Used for estimating the capacities of both distributed heating systems and heat-only boilers in district heating production across Europe.

The data is organized into the following columns:
- `demand` category: `DHW` for domestic hot water, `cooling` for space cooling, and `heating` for space heating.
- `unit` of measurement: [MW/GWh].
- `<country>` contains the corresponding value per country.

Produced by `demand_scaling.ipynb` with more details on how these are calculated based on the raw [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) output.


## `scenario_estimated_existing_capacities_MW.csv`

Estimated heating/cooling technology capacities in MW based on the [Hotmaps project results](https://gitlab.com/hotmaps?page=1) as well as the peak-to-yearly-demand ratios of the [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) output.
Essentially just multiplies the yearly demand by the estimated peak demand for distributed heating capacities.
District heating heat-only boiler capacities estimated based on fuel distributions in the [JRC-IDEES](http://data.europa.eu/89h/82322924-506a-4c9a-8532-2bdd30d69bf5) 2015 (for UK only) and 2021 datasets.

NOTE! The existing heating capacities of the heat pumps are pretty volatile, as the `Electricity` vs `ambient heat` ratios in the Hotmaps data is all over the place.
For most cases this is hopefully ok, but for some rows the estimated COP reaches hundreds and thousands, which is unrealistic.
Quirks of statistics, I suppose.

The sub-categorization of `district heating` is strictly speaking mostly unnecessary, but follows the original format of the Hotmaps project heating demand results (see `scenario_total_yearly_demands_GWh.csv`).
The sub-categories are more meaningful for `distributed heating`.

The data is organized into the following columns:
- `scenario` denotes the Hotmaps scenario: `ambitious` or `current`.
- `scenario_year` indicates the year the data depicts.
- `building_category` separates the building stock into residential `res` and non-residential `nonres`.
- `demand_category` distinguishes `distributed heating` and `district heating`demands.
- `demand` further distinguishes domestic hot water `DHW`, space `cooling`, and space `heating`.
- `technology` indicates the device serving the demand.
- `unit` of measurement: [MW].
- `<country>` columns present the values per country. (Includes IC1 zones for `NL` and `BE` for the industrial case study in WP5)

Produced by `process_capacity_data.ipynb` with more details on how the capacities are mapped and estimated.


## `scenario_total_yearly_demands_GWh.csv`

Total yearly space heating/cooling and domestic hot water heating demands
based on the [Hotmaps project results](https://gitlab.com/hotmaps?page=1).
These are used to scale the heating/cooling demand profiles to match a desired yearly scenario demand.

NOTE! While Norway and Switzerland are included, they don't have real scenario data in the Hotmaps results.
Instead, their demands are based on neighbouring countries and scaled based on population.

The data is organized into the following columns:
- `scenario` denotes the Hotmaps scenario: `ambitious` or `current`.
- `scenario_year` indicates the year the data depicts.
- `building_category` separates the building stock into residential `res` and non-residential `nonres`.
- `demand_category` distinguishes `distributed heating` and `district heating`demands.
- `demand` further distinguishes domestic hot water `DHW`, space `cooling`, and space `heating`.
- `unit` of measurement: [MW].
- `<country>` columns present the values per country. (Includes IC1 zones for `NL` and `BE` for the industrial case study in WP5)

Produced by `demand_scaling.ipynb` with more details on how the Hotmaps data is extended and aggregated.


## `simplified_capacities_with_decommissioning_MW.csv`

Further processed simplified existing capacities from `scenario_estimated_existing_capacities_MW` for Mopo WP5.
Unlike the aforementioned file,
the future capacities here are not based on the [Hotmaps project results](https://gitlab.com/hotmaps?page=1) except for the first year.
Instead, the capacities for the remaining years are estimated based on approximate decommissioning rates calculated from the `lifetime_y` parameter in the `heating_technology_params.csv`.

Also note that these capacities are totals over the `building_category` and heating/DHW `demand`.
`demand_category` and cooling `demand` are still separate due to different `technology` serving them.
The `scenario` is currently selected as `current`.

The data is organized into the following columns:
- `country` the data describes. (Includes IC1 zones for `NL` and `BE` for the industrial case study in WP5)
- `technology` indicates the type of asset the capacity values are for.
- `unit` of measurement [MW].
- `<year>` columns indicate the capacity values for the year in question.

Produced by `process_capacity_data.ipynb`.