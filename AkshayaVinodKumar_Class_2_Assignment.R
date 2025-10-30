### Assignment_2 ###

# Define input and output folders (input is current directory since file is attached)
input_dir <- ("D:/AI_Omics_Internship_2025/Module_I/raw_data")  
output_dir <- ("D:\\AI_Omics_Internship_2025\\Module_I\\results")

# Create output folder if it doesn't exist
#if (!dir.exists(output_dir)) {
#  dir.create(output_dir)
#}

# List files to process
files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")

# Prepare empty list to store results
result_list <- list()

# Define the gene classification function as per assignment

classify_gene <- function(logFC, padj, log2FC_threshold = 1, padj_threshold = 0.05) {
  if (is.na(logFC) | is.na(padj)) {
    return("Not_Significant")
  } else if (padj < padj_threshold & logFC > log2FC_threshold) {
    return("Upregulated")
  } else if (padj < padj_threshold & logFC < -log2FC_threshold) {
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}

# Loop through each file
for (DEGs_Data_1.csv in files_to_process) {
  cat("\nProcessing:", DEGs_Data_1.csv, "\n")
  
  input_file_path <- file.path(input_dir, DEGs_Data_1.csv)
  
  # Import dataset
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Dimensions:", nrow(data), "rows x", ncol(data), "columns\n")
  
  # Check and handle missing values (impute with mean if any, per reference style)
  missing_logFC <- sum(is.na(data$logFC))
  missing_padj <- sum(is.na(data$padj))
  cat("Missing values in 'logFC':", missing_logFC, "| in 'padj':", missing_padj, "\n")
  
  if (missing_logFC > 0) {
    data$logFC[is.na(data$logFC)] <- mean(data$logFC, na.rm = TRUE)
    cat("Imputed missing logFC with mean.\n")
  }
  if (missing_padj > 0) {
    data$padj[is.na(data$padj)] <- mean(data$padj, na.rm = TRUE)
    cat("Imputed missing padj with mean.\n")
  }
  
  # Apply classification
  data$Classification <- mapply(classify_gene, data$logFC, data$padj)
  cat("Gene classification completed.\n")
  
  # Generate and print summary counts
  summary_counts <- table(data$Classification)
  cat("\nSummary Counts for", DEGs_Data_1.csv, ":\n")
  print(summary_counts)
  
  # Store in result list
  result_list[[DEGs_Data_1.csv]] <- data
  
  # Save processed results
  output_file_path <- file.path(output_dir, paste0("Processed_", DEGs_Data_1.csv))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Processed data saved to:", output_file_path, "\n")
}

# Access the processed data if needed (for single file)
processed_data_1 <- result_list[[1]]

# Save workspace for submission
save.image("AkshayaVinodKumar_Class_2_Assignment.RData")
