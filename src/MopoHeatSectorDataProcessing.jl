module MopoHeatSectorDataProcessing

using DataFrames


## Common functions

"""
    extrapolate_years(
        df::DataFrame;
        extrapolation_years::Vector,
        combine::Function
    )
    
Extrapolate data in `df` across `extrapolation years`.

The `combine` keyword defines a function to use for handling DataFrame
`unstack` conflicts.
"""
function extrapolate_years(
    df::DataFrame;
    extrapolation_years::Vector,
    combine::Function
)
    df = unstack(df, :year, :val; combine=combine)
    for (i, year) in enumerate(extrapolation_years)
        missing_inds = ismissing.(df[!, Symbol(year)])
        isempty(missing_inds) && continue # Only missing inds require extrapolation.
        if i == 1 # Fill backwards for first year only.
            df[missing_inds, Symbol(year)] .= df[missing_inds, Symbol(extrapolation_years[i+1])]
        elseif length(extrapolation_years) > i # Try linear interpolation.
            df[missing_inds, Symbol(year)] = (
                df[missing_inds, Symbol(extrapolation_years[i-1])] .+
                df[missing_inds, Symbol(extrapolation_years[i+1])]
            ) ./ 2
        end
        if i > 1 # Find still missing inds and copy last year
            missing_inds = ismissing.(df[!, Symbol(year)])
            df[missing_inds, Symbol(year)] .= df[missing_inds, Symbol(extrapolation_years[i-1])]
        end
    end
    return stack(
        df,
        Symbol.(extrapolation_years);
        variable_name=:year,
        value_name=:val
    )
end

export extrapolate_years

end # module MopoHeatSectorDataProcessing
