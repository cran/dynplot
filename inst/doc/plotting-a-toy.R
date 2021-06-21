## ----setup, include = FALSE---------------------------------------------------
library(dplyr)
library(dynplot)
library(dynutils)
library(dynwrap)

set.seed(3)

## -----------------------------------------------------------------------------
data(example_bifurcating)
trajectory <- example_bifurcating

## ----onedim-------------------------------------------------------------------
plot_onedim(trajectory)

## ----dendro-------------------------------------------------------------------
plot_dendro(trajectory)

## ----graph--------------------------------------------------------------------
plot_graph(trajectory)

## -----------------------------------------------------------------------------
plot_topology(trajectory, layout = "circle")

## -----------------------------------------------------------------------------
plot_dimred(trajectory)
plot_dimred(trajectory, color_trajectory = "nearest")

## -----------------------------------------------------------------------------
grouping <- trajectory$prior_information$groups_id

## ----grouping-----------------------------------------------------------------
plot_onedim(trajectory, grouping = grouping)
plot_dendro(trajectory, grouping = grouping)
plot_graph(trajectory, grouping = grouping)
plot_dimred(trajectory, grouping = grouping)

## -----------------------------------------------------------------------------
feature_oi <- first(colnames(trajectory$counts))

## ----expression---------------------------------------------------------------
plot_onedim(trajectory, feature_oi = feature_oi)
plot_dendro(trajectory, feature_oi = feature_oi)
plot_graph(trajectory, feature_oi = feature_oi)
plot_dimred(trajectory, feature_oi = feature_oi)

## ----heatmap------------------------------------------------------------------
plot_heatmap(trajectory)

## -----------------------------------------------------------------------------
pseudotime <- trajectory$counts %>% prcomp() %>% {.$x[, 1]}
prediction <- 
  dynwrap::wrap_data(id = "dummy_prediction", cell_ids = trajectory$cell_ids) %>%
  dynwrap::add_linear_trajectory(pseudotime)

plot_linearised_comparison(trajectory, prediction)

