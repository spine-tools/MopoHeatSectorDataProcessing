# MopoHeatSectorDataProcessing/input-data

Input data required by
[MopoHeatSectorDataProcessing](https://github.com/spine-tools/MopoHeatSectorDataProcessing).

The raw input data are not included in this GitHub repository,
as they take up quite a bit of space.
The master README contains instructions for downloading the full set of inputs
used for the [Mopo AmBIENCE2ABM Demo](https://zenodo.org/records/10518294)
post-processing for the Mopo project case studies.

Please refer to the following subsections for more detailed information on the exact
data sources and their licenses.


## `abm-raw-data`

Raw [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel)
output from the [Mopo AmBIENCE2ABM Demo](https://zenodo.org/records/10518294) workflow.
Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode).

Provides the heating/cooling demand as well as heat pump coefficient of performance time series profiles.


## `dea-technology-catalogues`

Relevant
[Danish Energy Agency technology catalogue datasets](https://ens.dk/en/our-services/technology-catalogues),
licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode).

Provides the parameters for generation as well as storage technologies.


## `ENER-C2-2014-614`

Relevant results from the
[Mapping and analyses of the current and future (2020 - 2030) heating/cooling fuel deployment (fossil/renewables)](https://energy.ec.europa.eu/publications/mapping-and-analyses-current-and-future-2020-2030-heatingcooling-fuel-deployment-fossilrenewables-1_en)
study, published by the Directorate-General for Energy of the European Commission.
Unfortunately, the license isn't crystal clear, but it is clearly intended for publication.

Was considered as a potential source for existing heat-only generation capacity estimation, but ultimately not used by final data processing.


## `eurostat`

[Cooling and heating degree days by country - annual data](https://data.europa.eu/data/datasets/20yo9cdnqch1ilu65ktsig?locale=en).
Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode).

Was considered as a potential way of normalising weather variability, but ultimately not used in final data processing.


## `JRC-IDEES-2015_All_xlsx_UK`

The old [JRC-IDEES 2015 dataset](https://data.jrc.ec.europa.eu/dataset/jrc-10110-10001).
Licensing isn't crystal clear, but the cited [European Commission Reuse and Copyright Notice](https://data.jrc.ec.europa.eu/licence/com_reuse) permits reuse as long as the source is acknowledged.

Used to estimate existing district heating heat-only generation capacity in the UK, as they were omitted from the more recent JRC-IDEES 2021 used for the other countries.


## `JRC-IDEES-2021`

[The JRC-IDEES 2021 dataset](https://joint-research-centre.ec.europa.eu/scientific-tools-databases/potencia-policy-oriented-tool-energy-and-climate-change-impact-assessment-0/jrc-idees_en).
Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode).

Used to estimate existing district heating heat-only generation capacity in the EU27.


## `scen_ambitious_building_demand`

The corresponding
[Hotmaps project GitLab repository](https://gitlab.com/hotmaps/scen_ambitious_building_demand).
Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode).

Source of the heating/cooling demand scenario data.


## `scen_current_building_demand`

The corresponding
[Hotmaps project GitLab repository](https://gitlab.com/hotmaps/scen_current_building_demand).
Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode).

Source of the heating/cooling demand scenario data.


## `when2heat`

A part of the
[PECD consistent heat demand and COP time series from when2heat](https://doi.org/10.5281/zenodo.13962245)
dataset.
Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode).

Used as a comparison for the raw [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) heating profiles, but not for the final data processing itself.