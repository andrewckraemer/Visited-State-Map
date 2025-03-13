library(dplyr)
library(stringr)
library(ggplot2)
library(maps)

options(scipen = 999) ## To disable scientific notation

state <- map_data("state")

state$col<-ifelse(state$region=='hawaii','deepskyblue','orange')

state$col[state$region == 'nevada'] <- 'thistle4'
state$col[state$region == 'new mexico'] <- 'thistle4'
state$col[state$region == 'washington'] <- 'deepskyblue'
state$col[state$region == 'virginia'] <- 'deepskyblue'
state$col[state$region == 'idaho'] <- 'deepskyblue'
state$col[state$region == 'oregon'] <- 'deepskyblue'
state$col[state$region == 'montana'] <- 'deepskyblue'
state$col[state$region == 'wyoming'] <- 'deepskyblue'
state$col[state$region == 'michigan'] <- 'deeppink2'
state$col[state$region == 'arkansas'] <- 'deeppink2'
state$col[state$region == 'kansas'] <- 'deeppink2'
state$col[state$region == 'oklahoma'] <- 'deeppink2'
state$col[state$region == 'missouri'] <- 'deeppink2'
state$col[state$region == 'indiana'] <- 'deeppink2'
state$col[state$region == 'north dakota'] <- 'deepskyblue'
state$col[state$region == 'illinois'] <- 'deeppink2'
state$col[state$region == 'california'] <- 'deeppink2'
state$col[state$region == '?'] <- 'purple'
state$col[state$region == 'wisconsin'] <- 'deeppink2'
state$col[state$region == 'south dakota'] <- 'deeppink2'
state$col[state$region == 'minnesota'] <- 'deeppink2'
state$col[state$region == 'iowa'] <- 'deeppink2'
state$col[state$region == 'louisiana'] <- 'deeppink2'
state$col[state$region == 'texas'] <- 'deepskyblue'
state$col[state$region == 'nebraska'] <- 'deeppink2'
state$col[state$region == 'colorado'] <- 'deeppink2'
state$col[state$region == 'new york'] <- 'mediumseagreen'
state$col[state$region == 'florida'] <- 'mediumseagreen'
state$col[state$region == 'vermont'] <- 'mediumseagreen'
state$col[state$region == 'connecticut'] <- 'mediumseagreen'
state$col[state$region == 'north carolina'] <- 'mediumseagreen'

## Let's ditch many of the unnecessary elements
plain <- theme(
  axis.text = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.title = element_blank(),
  panel.background = element_rect(fill = "white"),
  plot.title = element_text(hjust = 0.5),
)

ggplot(data = state, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = col)) +
  ggtitle("Kraemer-Worthington Adventures") +
  plain  + scale_fill_identity('',guide = 'legend',labels=c('A, A, & J','A&A','A+A','ACK','not yet'))
