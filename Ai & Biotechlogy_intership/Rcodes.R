# to organize this folder 
# data
# script
# results

# create folder
dir.create("data")
dir.create("script")
dir.create("result")

# how R code works

print("Biotechnology")

# how to create a variable 
gene_expression <- c(2,3,3,8,3,9,5,6,9,4)

mean(gene_expression)
max(gene_expression)
# mean result are stored as variable
mean_resul <- mean(gene_expression)

# basic visualization of our varibale(gene-expression)
# plot
plot(gene_expression)
# histogram
hist(gene_expression)
# barplot
barplot(gene_expression)

# to check the summary of our data
summary(gene_expression)

# R data types 4 types
# 1- Numeric with decimal(+ve or -ve)
x <- 24
# 2- Integer or whole number
y<- 40 


# R classify decimal & whole number as numeric
# complex number or it will int. becos ML and pipelines uses less memoey as int. 
z <- 24L

# lets create a numeric variable
var_1 <- c(28.4, 23.7, 2.9)
# lets check the class of var_1
class(var_1)
# lets convert this to int by a function
as.integer(var_1) # decimal are remoed in output

# convert numeric to integer
var_2 <- as.integer(var_1)

# convert int to numeric
var_3 <- as.numeric(var_2)
class(var_3)

# Character or string data type 
var_4 <- c("gene1", "gene2", "gene3")
class(var_4)
# i can't take mean becos now it is character data
var_5 <- c("3.8", "4.6", "5.9")
mean(var_5) 

# i can take mean becos now it is numeric data
var_6 <- c(3.8, 4.6, 5.9)
mean(var_6)


disease_status <- c("cancer", "normal", "cancer","cancer", "normal")
class(disease_status)


# lets change this character into factor
disease_status <- as.factor(disease_status)
class(disease_status)
# lets check the levels of disease
disease_status

# lets compare the level

disease_status <- factor(disease_status, levels = c ("normal", "cancer"))
# now check the disease status
disease_status

# 5 logical data types
age <- c(23, 25, 28)

var_7 <- age < 25
install.packages("readr")
library(readr)


# import csv files
data <- read.csv("patient_info.csv")
View(data)
str(data)


# convert  height in to factor
data$height_fc <- as.factor(data$height)
str(data)


# relevels factors
data$height_fac <- factor(data$height_fac,
                          levels = c("Tall", "Meduim", "Short"))

levels(data$height_fac)

data$gender_fac <- as.factor(data$gender)
str(data)

# convert factor into numeric factor

data$gender_num <- ifelse(data$gender_fac == "Female", 1, 0)
class(data$gender_num)


# lets chaneg numeric into factor
data$gender_num <- as.factor(data$gender_num)
class(data$gender_num)


# lets save this script as csv
write.csv(disease_status, file = "result/patient_data.csv")


# save in image sworking dic choose thst f








