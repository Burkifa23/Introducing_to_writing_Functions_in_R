coin_sides <- c("head", "tail")

# Sample from coin_sides once
sample(coin_sides,1)


# Your functions, from previous steps
toss_coin <- function() {
  coin_sides <- c("head", "tail")
  sample(coin_sides, 1)
}

# Call your function
toss_coin()
