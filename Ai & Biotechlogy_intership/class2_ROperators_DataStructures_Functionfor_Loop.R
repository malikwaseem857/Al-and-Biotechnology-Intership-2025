



##-------------------------------------##
##   1. Operators in R

##  Operators are the special symbols in R
## They tell R to performs actions on values or variables
## Operators let us assign, calculate, compare and make logical decisions.


## Types of Operators

## 1. Assigments operators
## 2. Arithematic operators
## 3. Comparsion (relational) operators
## 4. Logical operators





## Assignment Operators

##  > Used to store values inside variables

##  > (Most common, rightward assignment operator)

height <- c(1.75, 1.76, 1.82, 1.67)

##  > (Same as above, but leftward assignment operator)
c(68, 78, 85, 75)  -> weight
##   Also assigns, used in function arguments)
smoking_status = c("Yes", "No", "Yes", "No")






## ---------------------------------##
##      Arithmetic Operators
## ---------------------------------##
##     Perform basic math i.e:
  
## +  addition
  
## - subtraction
## * multipiication
## / division
  
## ^ exponent (to the power of)


# lets BMI using weight and height

BMI <- weight/(height^2)
MBI


# Vectorization
# R perfoms operators to every value in the vector



# Comparsion Operators
#---------------------------------------------
# Comparison operators ask logical questions about values.
# They return output as TRUE or FALSE
# They don't calculate answer
They compare values

#   >  greater than
BMI > 25
#   <  less than
BMI < 18.5
#   >= greater than or equa1 to
#   <= less than or equa1 to
#   ==  is equal to

#   != not equal to


 # In R Yes= True, no= False

##   Logical Operators
# Logical operators let us combine conditions:

# & AND (both must be TRUE)
# is the patient overweight AND a smoker?
# BMI cutoff = 25
(BMI > 25) & (smoking_status == "Yes")
(BMI < 25) & (smoking_status == "Yes")

# | OR (at least one must be TRUE)
# is the patinet is overweight OR a smoker

(BMI > 25) | (smoking_status == "Yes")
BMI
smoking_status

# ! NOT (reverse the condition)
# is the patient NOT a smoker
smoking_status == "No"

# conditions = yes
# output = False




#------------ vectors-----------------------

# Simplest data structure in R.

# It stores a sequence of values,  but a11 of the same type.
# - Numeric vector 
num_vec <- c(1,2,3,4,5)
class(num_vec)
# numeric vectors used to performs mathematical calculations

# - Character vector
chrc_vector <- c("gene1", "gene2", "gene3" )
chrc_vector


# - Logica1 vector
logical_vector <- c(TRUE, FALSE, TRUE)


mix_vector <- c("gene1", 1, "gene2", 2)
mean(mix_vector)



# we can extract values from vectors using indexing with []

num_vec[2]
num_vec[2:4]  # : indicates sequences

# you can only combine vectors of equal sequences
# we can treat vectors as columns or a row
# by column
vec_col <- cbind(num_vec, chrc_vector)


#----------------------Lists-------------------

# Unlike vectors, a list can hold multiple types together
# numbers, text, logical even other data frames.
# 3 types of Vectors
all_vectors <- list(num_vec, chrc_vector, logical_vector)

# save you raw_data
# save protected data
# results


# we access elements with []
all_vectors
all_vectors[[2]]



#----------Matrices-------
# A matrix is a 2D structure (rows x co1umns).

# All values must be the same type (usually numeric).
#  Example: gene expression matrix where rows are genes and
# co1umns are samp1es.
my_matrix <- matrix(1:9, nrow = 3, ncol = 3)

# By default R fills the matrix columns wise
# we change using byrow = TRUE
my_matrix <- matrix(1:9, nrow = 3, ncol= 3, byrow = TRUE)

#  we access elements with [row, column]
my_matrix[2,3]
my_matrix[2,]  # extract from columns
# my_matrix[#rows, #columns]



#--------------------- Data Frames

# A data frame is the most important structures for real datsets.
# Each columns can be of a different type: Numeric, Character, or a Factor
data <- data.frame(
  patient_id = c("P1", "P2", "P3"),
  age = c(65, 78, NA),
  diagnosis = c("cancer", "diabetes", "cancer")
)

print(data)
#----------------Dataset Assessment----------------

# Function like str(), head(), dim(), and names() help us explore the dataset before analysis
str(data)  # strucute of dataset
head(data)  # first 6 rows of dataset
head(data, n = 2)
tail(data)  # last 6 rows of dataset
tail(data, n =1 )
dim(data)  # dimension of dataset and names of columns and rows
names(data) # columns and rows

# Data frames are indexed like matrix with more flexibilty 
# access a columns directly
data$patient_id
data[c(1,3), c(2,3)]



##-----------------------Missing values----------

# Real data is messy. Missing values in R are written as NA
# They can ruin calculation if not handled

# we can:
#    - detect them: is.na()
is.na(data)
#    - can count them: sum(is.na)
sum(is.na(data))

# Missing values by column
colSums(is.na(data))

# Missing values by rows
rowSums(is.na(data))

#   - remove them: na.omit()
# remove rows with missing values
clean_data_1 <- na.omit(data)
clean_data_1

# remove columns with missing values
clean_data2 <- data[, colSums(is.na(data))==0]


##  - replace them: impute with 0 or columns mean
clean_data_3 <- data

clean_data_3[is.na(clean_data)] <- 0
clean_data_4 <- data
# remember na.rm  function before removing missing values
clean_data_4[is.na(clean_data_4)] <- mean(data$age,na.rm = TRUE)
clean_data_4




# ---------------3. Function in R---------------

# Function let is wrap code into reusable blocks.

# Structure of a function
#      - name
#   calculate_BMI
#      - arguments (inputs)
function(x)  # input operation
#      - body (steps/operation)
  ( Bmi <- weight/height^2)
#      - return value (output)
return(Bmi)


# why use functions

#     - avoid repetitions
#     - Organize and simply code
#     - Reuse across projects
#     - Share with others


#  Create a function to calculate BMI
# Create a function to calculate BMI
calculate_BMI <- function(weight, height) {
  # operation we want to perform
  bmi <- weight / (height ^ 2)
  return(bmi)
}

# call the function

calculate_BMI(weight = 60, height = 1.75)

calculate_BMI(weight = weight, height = height)

calculate_BMI(60) # its output shows error 

# if you function is expecting two arguments 
calculate_BMI <- function(weight, height) {
  # operation we want to perform
  bmi <- weight / (height ^ 2)
  return(bmi)
}

calculate_BMI(60, 1.65)

# ----------------------Summary

# Function help is pcakage logic once and apply it to different input 


##  4. Automating workflows with Loop

#  Suppose you have multiple datasets and you want to:
#      - import them,
#      - check missing values
#      - clean columns
#      - compute BMI
#      - and save results


# Instead of repeating steps for each file, we use loops

# Typical Loops Workflows:


#    1. Define input and output process
input_dir <- "Raw_data"
output_dir <- "Results"

# create output folder if not already exist
if(dir.exists(output_dir)){
  dir.creat(output_dir)
}
# the results folder will be created if not already exist




#    2. List which files to process
files_to_process <- c("data_1.csv", "data_2.csv") # names of files
#    3. Prepare empty list to store result in R




 # 4. For each file:

#      - Import data
#      - check missing values
#      - clean columns
#      - compute BMI
#      - and save results (both in CSV and inside R list)
for (file_names in file_to_process) {
  cat("\nprocessing:", file_names, "\n")
  input_file_path <- file.path(input_dir, file_names)
  # import dataset
  data <- read.csv(input_file_path, header = TRUE)
  cat("File importedd. Checking for missing values...\n")
  # handling missing values
  if"height" %in% names(data){
    missing_count <- sum(is.na(data$height))
    cat("Missing values in 'height':", missing_count, "\n")
    data$height[is.na(data$height)] <- mean(data$height, na.rm = TRUE)
     if("weight %in%")
  }
  # calculate BMI
  data$bmi <- calculate_BMI(data$weight, data$height)
  cat("MBI has been calculated successfully.\n")
  
  # save results in R
  result_list[[file_names]] <- data
  # save results in Results folder
  output_file_path <- file.path(output_dir, past0("BMI_result"))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Results saved to: output_file_path, \n")
}




# Loop through files and save results
for (file_name in file_to_process) {
  cat("\nProcessing:", file_name, "\n")
  
  # build path and import
  input_file_path <- file.path(input_dir, file_name)
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Checking for missing values...\n")
  
  # handle missing height values
  if "height" %in% names(data) {
    missing_count <- sum(is.na(data$height))
    cat("Missing values in 'height':", missing_count, "\n")
    data$height[is.na(data$height)] <- mean(data$height, na.rm = TRUE)
  }
  
  # handle missing weight values
  if "weight" %in% names(data) {
    missing_count <- sum(is.na(data$weight))
    
    cat("Missing values in 'weight':", missing_count, "\n")
    data$weight[is.na(data$weight)] <- mean(data$weight, na.rm = TRUE)
  }
  
  # calculate BMI
  data$bmi <- calculate_BMI(data$weight, data$height)
  cat("BMI has been calculated successfully.\n")
  
  # save results in R list
  result_list[[file_name]] <- data
  
  # save results in Results folder
  output_file_path <- file.path(output_dir, paste0("BMI_result_", file_names))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Results saved to:", output_file_path, "\n")
}



# The loop repeats until all files are processed
results_1 <- result_list[[1]]
results_2 <- result_list[[2]]


# ----------------------Summary-----------------

# Loops automate repetitve work
#  make your workflow faster
# consistent, and reproductive



