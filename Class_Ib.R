#### Tasks ####


# 1. Set Working Directory
  # Create a new folder on your computer "AI_Omics_Internship_2025".
  getwd()
  setwd("D:/AI_Omics_Internship_2025/Module_I")


# 2. Create Project Folder
  # In RStudio, create a new project named "Module_I" in your "AI_Omics_Internship_2025" folder.
  # Go to the File menu > select 'New Project' > choose 'New Directory' > then 'New Project'
  # Name your project and choose the location (your main folder)
  # Inside the project directory, create the following subfolders using R code:
  # [raw_data, clean_data, scripts, results or Tasks, plots etc]

  dir.create("raw_data")          # create subfolder 'raw_data'
  dir.create("clean_data")        # create subfolder 'clean_data'
  dir.create("scripts")           # create subfolder 'scripts'
  dir.create("results")           # create subfolder 'results'
  dir.create("plots")             # create subfolder 'plots'

# 3. Download "patient_info.csv" dataset from GitHub repository
 
  # load the dataset into your R environment
  data <- read.csv(file.choose())

  # Inspect the structure of the dataset using appropriate R functions
  View(data)     # view dataset
  str(data)      # check structure
  
  # convert 'gender' to factor
  data$gender_fac <- as.factor(data$gender)
  str(data)
  # Convert factor to numeric using ifelse statement (Female = 1, Male = 0)
  data$gender_num <- ifelse(data$gender_fac == "Female", 1, 0)
  class(data$gender_num)
  
  # convert 'diagnosis' to factor
  data$diagnosis_fac <- as.factor(data$diagnosis)
  # Convert factor to numeric using ifelse statement (Cancer = 1, Normal = 0)
  data$diagnosis_num <- ifelse(data$diagnosis_fac == "Cancer", 1, 0)
  class(data$diagnosis_num)
  
  # convert 'smoker' to factor
  data$smoker_fac <- as.factor(data$smoker)
  str(data)
  # Convert factor to numeric using ifelse statement (Yes = 1, No = 0)
  data$smoker_num <- ifelse(data$smoker_fac == "Yes", 1, 0)
  class(data$diagnosis_num)
  
  # Create a new variable for smoking status as a binary factor:
  smoking_status <- data$smoker_num
  
  #save file as csv format
  write.csv(data, file = "D:/AI_Omics_Internship_2025/Module_I/results/patient_info_clean.csv")
  
  #save workspace
  save.image(file = "D:/AI_Omics_Internship_2025/Module_I/AkshayaVinodKumar_ClassIb_Assignment.RData")
  #load workspace
  load("D:/AI_Omics_Internship_2025/Module_I/AkshayaVinodKumar_ClassIb_Assignment.RData")
  