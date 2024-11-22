# Define file paths
input_file <- "data.csv"
output_file <- "output.csv"

# Check if input file exists
if (!file.exists(input_file)) {
    stop("The input file does not exist.")
}

# Read data from CSV file
data <- read.csv(input_file)

# Check if the required column exists and is numeric
if (!"value" %in% colnames(data)) {
    stop("The input file must contain a column named 'value'.")
}
if (!is.numeric(data$value)) {
    stop("The 'value' column must contain numeric data.")
}

# Perform calculations
mean_value <- mean(data$value)
data$deviation_from_mean <- data$value - mean_value

# Write the updated data to a new CSV file
write.csv(data, output_file, row.names = FALSE)
