# From previous step
get_reciprocal <- function(x) {
  1 / x
}

# Write a function to calculate the harmonic mean
calc_harmonic_mean <- function(x) {
  x %>%
    get_reciprocal() %>%
    mean() %>%
    get_reciprocal()
}

