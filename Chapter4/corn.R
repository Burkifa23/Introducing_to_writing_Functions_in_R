# View the corn dataset
glimpse(corn)

corn %>%
  # Add some columns
  dplyr::mutate(
    # Convert farmed area from acres to ha
    farmed_area_ha = acres_to_hectares(farmed_area_acres),
    # Convert yield from bushels/acre to kg/ha
    yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(
      yield_bushels_per_acre,
      crop = "corn"
    )
  )

# Wrap this code into a function
fortify_with_metric_units <- function(data, crop) {
  data %>%
    dplyr::mutate(
      farmed_area_ha = acres_to_hectares(farmed_area_acres),
      yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(
        yield_bushels_per_acre,
        crop = crop # Pass the function's 'crop' argument here
      )
    )
}

# Try it on the wheat dataset
fortify_with_metric_units(wheat, crop = "wheat")





# Using corn, plot yield (kg/ha) vs. year
ggplot(corn, aes(x=year, y=yield_kg_per_ha)) +
  # Add a line layer, grouped by state
  geom_line(aes(group = state)) +
  # Add a smooth trend layer
  geom_smooth()


# Wrap this plotting code into a function
plot_yield_vs_year <- function(data) {
  ggplot(data, aes(year, yield_kg_per_ha)) +
    geom_line(aes(group = state)) +
    geom_smooth()
}

# Test it on the wheat dataset
plot_yield_vs_year(wheat)

# Inner join the corn dataset to usa_census_regions by state
corn %>%
  dplyr::inner_join(usa_census_regions, by = "state")


# Wrap this code into a function
fortify_with_census_region <- function(data) {
  data %>%
    dplyr::inner_join(usa_census_regions, by = "state")
}

# Try it on the wheat dataset
fortify_with_census_region(wheat)

# Plot yield vs. year for the corn dataset
plot_yield_vs_year(corn) +
  # Facet, wrapped by census region
  facet_wrap(vars(census_region))


# Wrap this code into a function
plot_yield_vs_year_by_region <- function(data) {
  plot_yield_vs_year(data) +
    facet_wrap(vars(census_region))
}

# Try it on the wheat dataset
plot_yield_vs_year_by_region(wheat)



# Run a generalized additive model of yield vs. smoothed year and census region
mgcv::gam(yield_kg_per_ha ~ s(year) + census_region, data = corn)
