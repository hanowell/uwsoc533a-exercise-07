# Exercise 7 data collection

## Load packages ----
library(dplyr)
library(HMDHFDplus)
library(keyring)

## Generate data ----
CHLbirthsRR <- HMDHFDplus::readHFDweb(
  CNTRY = "CHL",
  item = "birthsRR",
  username = keyring::key_list("human-fertility-database")$username,
  password = keyring::key_get(
    service = "human-fertility-database",
    username = keyring::key_list("human-fertility-database")$username
  )
) %>%
  dplyr::filter(Year == 1992) %>%
  dplyr::select(-Year)
saveRDS(CHLbirthsRR, "data/CHLbirthsRR.rds")
CHLasfrRR <- HMDHFDplus::readHFDweb(
  CNTRY = "CHL",
  item = "asfrRR",
  username = keyring::key_list("human-fertility-database")$username,
  password = keyring::key_get(
    service = "human-fertility-database",
    username = keyring::key_list("human-fertility-database")$username
  )
) %>%
  dplyr::filter(Year == 1992) %>%
  dplyr::select(-Year)
saveRDS(CHLbirthsRR, "data/CHLasfrRR.rds")
