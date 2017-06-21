# This was the Rscript file I wrote Tuesday afternoon

surveys <- read.csv("data/portal_data_joined.csv")
head(surveys)

# Histgram of weights
hist(surveys$weight, main="Distribution of weight",
     xlab="weights (g)", col="red")

# Demonstration of if statements
if (surveys$year[1] == 1984) {
    print("Great Scott, it's 1984!")
} else {
    print("It's not 1984")
}

surveys$year[1]

# Answer to the challenge:
if (surveys$weight[40] > 28.3) {
    print("It's a biggun")
} else {
    print("It's not very big.")
}

# Loops
for (i in 1:10) {
    print(i)
}

for (i in 1:10) {
    print("cookie")
}

for (i in c("cat", "dog", "mouse")) {
    print(i)
}

# Write for loop to determine if year is 1984
for (i in 1:nrows(surveys)) {
    if (surveys$year[i] == 1984) {
        print("Great Scott, it's 1984!")
    } else {
        print("It's not 1984")
    }
}

# Save to a new variable
surveys_adjusted <- surveys

for (i in 1:nrow(surveys_adjusted)) {
    if (surveys_adjusted$year[i] == 1984) {
        surveys_adjusted$weight[i] <- surveys_adjusted$weight[i] * 1.1
    }
}

# Mean weight of the 1984 records in the original data
o_weight <- mean(surveys$weight[surveys$year == 1984], 
                 na.rm = T)

# Mean weight of the 1984 records in the updated data
a_weight <- mean(surveys_adjusted$weight[surveys_adjusted$year == 1984],
                 na.rm = T)
a_weight
o_weight *1.1

surveys_adj_no_na <- surveys_adjusted[!is.na(surveys_adjusted$weight),]
big_animals <- 0
for (i in 1:nrow(surveys_adj_no_na)) {
    if (surveys_adj_no_na$weight[i] > 28.3) {
        big_animals <- big_animals + 1
    }
}
big_animals


number_of_big_animals = 0
number_of_small_f = 0
number_of_small_m = 0
for (i in 1:dim(surveys_adj_no_na)[1]) {
    if (surveys_adj_no_na$weight[i] > 28.3) {
        number_of_big_animals <- number_of_big_animals + 1
    } else {
        if (surveys_adj_no_na$sex[i] == "F") {
            number_of_small_f <- number_of_small_f + 1
        } else if (surveys_adj_no_na$sex[i] == "M") {
            number_of_small_m <- number_of_small_m + 1
        }
    }
}

library("tidyverse")

# Select
select(surveys, plot_id, species_id, weight)
select(surveys, month:year)

# Only records for the year 1995
y1995 <- filter(surveys, year == 1995)

weight5 <- filter(surveys, weight < 5)
select(weight5, species_id, sex, weight)

surveys_sml <- surveys %>%
    filter(weight < 5) %>%
    select(species_id, sex, weight)

head(surveys_sml)

surveys %>%
    filter(year < 1995) %>%
    select(year, sex, weight)

# Mutate

surveys %>%
    filter(!is.na(weight)) %>%
    mutate(weight_kg = weight/1000) %>%
    head

# Answer to the challenge
challenge <- surveys %>%
    filter(!is.na(hindfoot_length)) %>%
    mutate(hindfoot_half = hindfoot_length/2) %>%
    filter(hindfoot_half < 30) %>%
    select(species_id, hindfoot_half)

# group_by summarize
surveys %>%
    filter(!is.na(weight)) %>%
    group_by(sex, species_id) %>%
    summarize(mean_weight = mean(weight, na.rm = T))

# Make dataset for plotting
surveys_complete <- surveys %>%
    filter(species_id != "",
           !is.na(weight),
           !is.na(hindfoot_length),
           sex != "")
dim(surveys_complete)

surveys_plot <- ggplot(data = surveys_complete, 
       aes(x = weight, y = hindfoot_length)) 


ggplot(data = surveys_complete, 
       aes(x = weight, y = hindfoot_length)) + 
    geom_point(alpha = 0.1, aes(color=species_id))

# Boxplot of hindfoot_length by species_id
ggplot(data = surveys_complete, 
       aes(x = species_id, y = hindfoot_length)) +
    geom_jitter(alpha = 0.3, color = "tomato") +
    geom_boxplot() 

# Summarize species counts by year
yearly_counts <- surveys_complete %>%
    group_by(year, species_id) %>%
    tally
yearly_counts

# Number of species in each year
ggplot(data = yearly_counts, 
       aes(x = year, y = n, group = species_id, 
           color = species_id)) +
    geom_line() +
    facet_wrap(~ species_id)

# Faceting

# Yearly counts by sex
yearly_sex_counts <- surveys_complete %>%
    group_by(year, species_id, sex) %>%
    tally

# Facet wrap plot by species, but separate lines for sex
myplot <- ggplot(data = yearly_sex_counts,
       aes(x = year, y = n, 
           color = sex, group=sex)) +
    geom_line() +
    facet_wrap(~ species_id) +
    theme_bw()
ggsave("mysweetplot.pdf", myplot, 
       width=15, height=10)
