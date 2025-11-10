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

# Wrap this code into a function, groom_model
groom_model<- function(model) {
  list(
    model = glance(model),
    coefficients = tidy(model),
    observations = augment(model)
  )
}
