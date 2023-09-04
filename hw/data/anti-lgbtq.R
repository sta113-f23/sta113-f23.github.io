# load packages –---------------------------------------------------------------

library(tidyverse)

# load data --------------------------------------------------------------------

fortune_aggregates <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-07/fortune_aggregates.csv')
static_list <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-07/static_list.csv')

# prepare data for HW 1 --------------------------------------------------------

anti_lgbtq <- static_list |>
  janitor::clean_names() |>
  filter(company != "Grand Total") |>
  rename(
    pride_sponsor = pride,
    hrc_pledge = hrc_business_pledge,
    contribution_amount = amount_contributed_across_states,
    n_politicians = number_of_politicians_contributed_to,
    n_states = number_of_states_where_contributions_made
  ) |>
  mutate(fortune_500 = if_else(company %in% fortune_aggregates$Company, TRUE, FALSE))

# save data --------------------------------------------------------------------

write_csv(anti_lgbtq, here::here("hw/data", "anti-lgbtq.csv"))
