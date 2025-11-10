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

coin_sides <- c("head", "tail")
n_flips <- 10

# Sample from coin_sides n_flips times with replacement
sample(coin_sides, n_flips, replace=TRUE)

# Update the function to return n coin tosses
toss_coin <- function(n_flips) {
  coin_sides <- c("head", "tail")
  sample(coin_sides, n_flips, replace=TRUE)
}

# Generate 10 coin tosses
toss_coin(10)

coin_sides <- c("head", "tail")
n_flips <- 10
p_head <- 0.8

# Define a vector of weights
weights <- p_head

# Update so that heads are sampled with prob p_head
sample(coin_sides, n_flips, replace = TRUE, prob = c(p_head,1-p_head))
