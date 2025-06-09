# MopoHeatSectorDataProcessing

Data processing scripts for dealing with heat sector data required in the Mopo project.


## Key contents

1. `input-data/` contains the raw data sources used for the processing scripts.
2. `output/` contains the processed output `.csv` files.
3. `cop_export.ipynb` postprocesses and exports [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) heat pump COP timeseries for Mopo WP5.
4. `demand_scaling.ipynb` postprocesses the [ArchetypeBuildingModel](https://github.com/vttresearch/ArchetypeBuildingModel) heating/cooling demand timeseries, as well as processess [Hotmaps](https://gitlab.com/hotmaps) heating/cooling demand scenario data.
5. `demand_testing.ipynb` contains experiments and examination of the data underlying `demand_scaling.ipynb`.
6. `examine_capacity_data.ipynb` examines the raw data available for heat-only capacity estimation for `process_capacity_data.ipynb`.
7. `examine_generation_data.ipynb` examines the generation technology data for `process_generation_data.ipynb`.
8. `examine_storage_data.ipynb` examines the storage technology data for `process_storage_data.ipynb`.
9. `process_capacity_data.ipynb` processes and output estimated heat-only generation capacity data for Mopo WP5.
10. `process_generation_data.ipynb` processes and outputs generation data for Mopo WP5.
11. `process_storage_data.ipynb` processes and outputs storage technology parameters for Mopo WP5.


## Installation

Clone (or download) this repository on your machine.
Since the processing scripts are written in [Julia](https://julialang.org/),
you'll need to have it installed on your machine.

Note that since the processing scripts are Jupyter notebooks,
you'll also need to install the [IJulia](https://github.com/JuliaLang/IJulia.jl)
package to your Julia.
Depending on how you run the scripts, this step might be automatic,
but you can do this manually in Julia REPL as well:
```julia
julia> ]
(@v1.11) pkg> add IJulia
```

The Jupyter notebooks contain code to automatically set up the necessary Julia environment.
However, you can also do this manually by opening the Julia REPL in the folder this `README.md` is located in
```julia
julia>
```
entering the package manager
```julia
julia> ]
```
and manually instantiating the dependencies
```
(MopoHeatSectorDataProcessin...) pkg> instantiate
```

### Required input data

The data processing scripts require quite a bit of input data,
and including them within this GitHub repository is not really ideal.
Thus, an example input data set has been archived in [Zenodo](https://doi.org/10.5281/zenodo.14280884),
which needs to be extracted under the `input-data` folder for the scripts to run correctly.


## Use

The processed output files are not included in this repository,
as the timeseries especially take up quite some space.

In order to recreate them, simply run the Jupyter notebooks handling the data processing.
However, note that you will need to download the required input data
separately as described above.


## License

The codebase and the output are licensed under the [MIT License](https://opensource.org/license/mit),
see `LICENSE` for more information.

The required input files all have slightly different licenses,
see the README in the [Zenodo dataset](https://doi.org/10.5281/zenodo.14280884) for more information.


## Acknowledgements

<center>
<table width=500px frame="none">
<tr>
<td valign="middle" width=100px>
<img src=https://european-union.europa.eu/themes/contrib/oe_theme/dist/eu/images/logo/standard-version/positive/logo-eu--en.svg alt="EU emblem" width=100%></td>
<td valign="middle">This work was supported by EU project Mopo (2023-2026), which has received funding from European Climate, Infrastructure and Environment Executive Agency under the European Union’s HORIZON Research and Innovation Actions under grant agreement N°101095998.</td>
</table>
</center>