data <- read.csv(file = "C:/Users/Lenovo/Desktop/Tilburg/thesis/billboard.csv", sep = ';', header=TRUE)
data_unique <- data[match(unique(data$song), data$song),]
install.packages("writexl")
library("writexl")
write_xlsx(data_unique,"C:/Users/Lenovo/Desktop/Tilburg/thesis/data_unique.xlsx")
table(data_unique$peak.rank)

install.packages("dplyr")
library(dplyr)
name_artist_rank <- select(data_unique, song, artist, peak.rank)
write_xlsx(name_artist_rank,"C:/Users/Lenovo/Desktop/Tilburg/thesis/name_artist_rank.xlsx")

whole_dataset <- select(data, rank, song, artist, peak.rank)
write_xlsx(whole_dataset,"C:/Users/Lenovo/Desktop/Tilburg/thesis/whole_dataset.xlsx")

--------------
data <- read.csv(file = "C:/Users/Lenovo/Desktop/Tilburg/thesis/billboard.csv", sep = ';', header=TRUE)

library(dplyr)
df <- data %>%
  group_by(song) %>%
  slice(which.max(weeks.on.board))

install.packages("writexl")
library("writexl")
install.packages("dplyr")
library(dplyr)
dataset <- select(df, song, artist, peak.rank, weeks.on.board)
write_xlsx(dataset,"C:/Users/Lenovo/Desktop/Tilburg/thesis/dataset.xlsx")
table(dataset$peak.rank)