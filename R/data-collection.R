# Exercise 7 data collection

## Load packages ----
library(dplyr)
library(HMDHFDplus)
library(keyring)

## Generate data for Chile in 1992 ----
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

## Parity data ----
parity_data <- rlnorm(n = 100000, meanlog = 1, sdlog = .3) %>%
  tibble::tibble(parity = round(., 0))
saveRDS(parity_data, "data/parity_data.rds")
