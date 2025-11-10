# Look at the structure of model (it's a mess!)
str(model)

# Use broom tools to get a list of 3 data frames
list(
  # Get model-level values
  model = broom::glance(model),
  # Get coefficient-level values
  coefficients = broom::tidy(model),
  # Get observation-level values
  observations = broom::augment(model)
)
