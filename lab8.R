# Lab 8 - Tidy Data and Factors
#
# INSTRUCTIONS
# - Complete all work in this script (lab8.R).
# - Write your code below each TODO. Keep the section headers.
# - Use the hints, weekly examples, and function documentation as needed.
# - Add brief comments explaining your work.
# - Answer both reflection questions in comments.
# - Run each section as you work. Save, commit, and push your changes.
#
# SUBMISSION
# - Restart R and run the entire completed script from the beginning.
# - Confirm that the required data frames and graphs are produced without errors.
# - Separate image files and knitted HTML are not required.
# - After pushing your work, submit your repository URL in Blackboard.

# -------------------------------------------------------------------
# Package Setup
# -------------------------------------------------------------------
# Install tidyverse and scales in the Console if needed.
# Do not add install.packages() commands to your submitted script.

library(tidyverse)
library(scales)

# -------------------------------------------------------------------
# EXERCISE 1 - Democracy Scores (reshaping data)
# -------------------------------------------------------------------
# The data for this exercise is available at:
# https://moderndive.com/data/dem_score.csv

# TODO 1.1: Read the data into a data frame named dem_score.
# Inspect the data before reshaping it.
# Hint: read_csv().


# TODO 1.2: Reshape the data into a data frame named dem_score_tidy.
# Required columns: country, year (integer), democracy_score.
# Each row should represent one country in one year.
# Hints: pivot_longer() moves column names and values into new columns.
# Use names_to and values_to to name those columns, and cols to select
# the columns to reshape. Use mutate() and as.integer() to convert year.


# TODO 1.3: Display the first 5 rows of dem_score_tidy.
# Confirm the required column names and inspect the year column's type.
# Hints: head(), glimpse().


# -------------------------------------------------------------------
# EXERCISE 2 - Life Expectancy (reshaping data)
# -------------------------------------------------------------------
# The data for this exercise is available at:
# https://moderndive.com/data/le_mess.csv

# TODO 2.1: Read the data into a data frame named le_mess.
# Inspect the data before reshaping it.


# TODO 2.2: Reshape the data into a data frame named le_tidy.
# Required columns: country, year (integer), life_expectancy.
# Each row should represent one country in one year.
# Hint: Apply the same approach you used in Exercise 1.


# TODO 2.3: Display the first 5 rows of le_tidy.
# Confirm the required column names and inspect the year column's type.


# -------------------------------------------------------------------
# EXERCISE 3 - Join the Two Tidy Datasets
# -------------------------------------------------------------------
# TODO 3.1: Combine dem_score_tidy and le_tidy into df_combined.
# Use an inner join on BOTH country and year. Keep only country-year
# combinations present in both datasets.
# Select these columns in this order:
# country, year, life_expectancy, democracy_score.
# Hints: inner_join(), the by argument, select().


# TODO 3.2: Display the first 10 rows of df_combined.


# -------------------------------------------------------------------
# EXERCISE 4 - Star Wars Eye Colors (factors and lumping)
# -------------------------------------------------------------------
# Use the built-in dplyr::starwars dataset.

# TODO 4.1: Exclude observations with missing eye_color values.
# Count the remaining observations by eye color and save the result
# as starwars_eye_counts. Sort the counts from largest to smallest.
# Hints: filter(), is.na(), count(), sort = TRUE.


# TODO 4.2: Create a horizontal bar chart from starwars_eye_counts.
# Display each eye color and its count. Order categories by count so
# the largest bar is at the top. Include a descriptive title and axis labels.
# Hints: ggplot(), aes(), fct_reorder(), geom_col(), coord_flip(), labs().
# geom_col() uses counts you have already calculated.


# TODO 4.3: Start again with the original starwars observations.
# Exclude missing eye colors. Create eye_color_top, retaining the five
# most frequent eye colors and combining the rest into "Other".
# Then count the new categories and save the result as starwars_top5.
# Hints: mutate(), fct_lump_n(), n, other_level, count().
# Lump BEFORE counting so frequency is based on characters, not summary rows.
# The default behavior retains ties at the cutoff. Accept additional categories
# if there are ties; you do not need to force exactly six groups.


# TODO 4.4: Create a second horizontal bar chart using starwars_top5.
# Order categories by count so the largest bar is at the top.
# Include a descriptive title and axis labels.


# TODO 4.5: Reflection. Write 1-2 sentences in comments.
# How does combining categories into Other help the graph?
# What information is lost when you combine those categories?
# Answer:


# -------------------------------------------------------------------
# EXERCISE 5 - Hotel Rates by Month (ordering factors)
# -------------------------------------------------------------------
# The data for this exercise is available at:
# https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2020/2020-02-11/hotels.csv
#
# ADR means Average Daily Rate. Include all bookings in this exercise;
# no additional filtering is required.

# TODO 5.1: Read the data into a data frame named hotels.


# TODO 5.2: Calculate mean adr for each hotel type and arrival month.
# Save the result as adr_by_month with columns:
# hotel, arrival_date_month, mean_adr.
# Exclude missing adr values from the mean calculation and return
# an ungrouped summary.
# Hints: group_by(), summarise(), mean(), na.rm, .groups.


# TODO 5.3: Run this supplied plot after creating adr_by_month.
# Inspect the default month order.
adr_by_month |>
  ggplot(aes(x = arrival_date_month, y = mean_adr, fill = hotel)) +
  geom_col(position = "dodge") +
  labs(title = "Average Daily Rate by Month and Hotel (Default Order)",
       x = "Month", y = "Average Daily Rate")

# TODO 5.3a: Reflection. Write 1-2 sentences in comments.
# How are the months ordered in the initial plot? What would be a better order?
# Answer:


# TODO 5.4: Create and save adr_by_month_ordered from adr_by_month.
# Convert arrival_date_month to a factor with levels in calendar order.
# Hints: mutate(), fct(), the levels argument, month.name.
# month.name contains the full month names from January through December.
# An ordered factor is not required simply to control display order.


# TODO 5.5: Create a grouped bar chart using adr_by_month_ordered.
# Put month on the x-axis and mean ADR on the y-axis, with separate bars
# filled by hotel type. Confirm January through December appear in order.
# Include a descriptive title and axis labels. Format y-axis labels
# with dollar signs and adjust month-label text if needed for readability.
# Hints: geom_col(), position = "dodge", scale_y_continuous(),
# scales::dollar, theme(), element_text().
# Formatting labels with dollar signs does not convert the underlying values.


# -------------------------------------------------------------------
# Before Submitting
# -------------------------------------------------------------------
# - Complete all TODOs, both reflections, and explanatory comments.
# - Check that df_combined has the required columns in the specified order.
# - Check that both eye-color graphs count the same total number of characters.
# - Check that the final hotel graph displays months in calendar order.
# - Restart R and run the entire completed script from the beginning.
# - Save, commit, push, and submit your repository URL in Blackboard.
