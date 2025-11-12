# Write a function to convert acres to sq. yards
acres_to_sq_yards <- function(acres) {
  acres * 4840
}

# Write a function to convert yards to meters
yards_to_meters <- function(yards) {
    yards * 36* 0.0254
}

# Write a function to convert sq. meters to hectares
sq_meters_to_hectares <- function(sq_meters) {
    sq_meters / 10000
}

# Write a function to convert sq. yards to sq. meters
sq_yards_to_sq_meters <- function(sq_yards) {
  sq_yards %>%
    # Take the square root
    sqrt() %>%
    # Convert yards to meters
    yards_to_meters() %>%
    # Square it
    magrittr::raise_to_power(2)
}

# Write a function to convert acres to hectares
acres_to_hectares <- function(acres) {
  acres %>%
    # Convert acres to sq yards
    acres_to_sq_yards() %>%
    # Convert sq yards to sq meters
    sq_yards_to_sq_meters()  %>%
    # Convert sq meters to hectares
    sq_meters_to_hectares()
}

# Define a harmonic acres to hectares function
harmonic_acres_to_hectares <- function(acres) {
  acres %>% 
    # Get the reciprocal
    get_reciprocal() %>%
    # Convert acres to hectares
    acres_to_hectares() %>% 
    # Get the reciprocal again
    get_reciprocal
}

# Write a function to convert lb to kg
lbs_to_kgs <- function(lbs) {
  lbs * 0.45359237
}
