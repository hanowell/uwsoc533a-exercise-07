# Exercise 7 data collection

## Load packages ----
library(dplyr)
library(HMDHFDplus)
library(keyring)

## Generate data ----
CHLbirthsRRbo <- HMDHFDplus::readHFDweb(
  CNTRY = "CHL",
  item = "birthsRRbo",
  username = keyring::key_list("human-fertility-database")$username,
  password = keyring::key_get(
    service = "human-fertility-database",
    username = keyring::key_list("human-fertility-database")$username
  )
) %>%
  dplyr::filter(Year == 1992) %>%
  dplyr::select(-Year)
saveRDS(CHLbirthsRRbo, "data/CHLbirthsRRbo.rds")
CHLasfrRRbo <- HMDHFDplus::readHFDweb(
  CNTRY = "CHL",
  item = "asfrRRbo",
  username = keyring::key_list("human-fertility-database")$username,
  password = keyring::key_get(
    service = "human-fertility-database",
    username = keyring::key_list("human-fertility-database")$username
  )
) %>%
  dplyr::filter(Year == 1992) %>%
  dplyr::select(-Year)
saveRDS(CHLasfrRRbo, "data/CHLasfrRRbo.rds")
