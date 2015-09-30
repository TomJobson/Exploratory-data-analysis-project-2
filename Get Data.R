# ========== Get data ==========
# Download and unzip file if the files do not exist
if (!file.exists("dataNEI.zip")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileURL, "dataNEI.zip")
  unzip("dataNEI.zip")
} else {
  if (!file.exists("Source_Classification_Code.rds") | !file.exists("summarySCC_PM25.rds")) {
    unzip("Dataset.zip")
  }
}

# ========== Read data ==========
# Read data if NEI and SCC do not exist
if (!exists("NEI")) {
  NEI <- readRDS("summarySCC_PM25.rds")
}
if (!exists("SCC")) {
  SCC <- readRDS("Source_Classification_Code.rds")
}