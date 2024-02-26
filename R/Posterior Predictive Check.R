
library(tidyverse)
library(lme4)
library(here)
library(brms)
library(rstan)
library(modelr)
library(tidyverse)    # ggplot, dplyr, %>%, and friends
library(brms)         # Bayesian modeling through Stan
library(tidybayes)    # Manipulate Stan objects in a tidy way
library(broom)        # Convert model objects to data frames
library(broom.mixed)  # Convert brms model objects to data frames
library(emmeans)      # Calculate marginal effects in even fancier ways
library(patchwork)    # Combine ggplot objects
library(ggokabeito)   # Neat accessible color palette
library(gghalves)     # Special half geoms
library(ggbeeswarm)   # Special distribution-shaped point jittering
library(ggdist)
library(bayesplot)

# load data and models
dat <- readRDS(here("Rdata/dat.RDS"))
mod_total <- readRDS(here("Rdata/Final Models/mod_Total.rds"))

#find columns for incidence values
colnames(dat)
dat$total_incidence[1:50]

# identify total incidence values
dis_inc <- dat$total_incidence

# identify posterior predictions of total incidence
dis_pred <- posterior_predict(mod_total)
dim(dis_pred)

# plot posterior predictions to check they match
ppc_dens_overlay(dis_inc, dis_pred[1:500, ]) + xlim(0, 40)

# check posterior predictions using brms package
pp_check(mod_total, type = "bars")
