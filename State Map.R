library(dplyr)
library(stringr)
library(ggplot2)
library(maps)

options(scipen = 999) ## To disable scientific notation

state <- map_data("state")
head(state)
table(world$region)


worldgovt <- state
worldgovt$col<-ifelse(worldgovt$region=='hawaii','deepskyblue','orange')

worldgovt$col[worldgovt$region == 'nevada'] <- 'thistle4'
worldgovt$col[worldgovt$region == 'new mexico'] <- 'thistle4'
worldgovt$col[worldgovt$region == 'washington'] <- 'deepskyblue'
worldgovt$col[worldgovt$region == 'virginia'] <- 'deepskyblue'
worldgovt$col[worldgovt$region == 'idaho'] <- 'deepskyblue'
worldgovt$col[worldgovt$region == 'oregon'] <- 'deepskyblue'
worldgovt$col[worldgovt$region == 'montana'] <- 'deepskyblue'
worldgovt$col[worldgovt$region == 'wyoming'] <- 'deepskyblue'
worldgovt$col[worldgovt$region == 'michigan'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'arkansas'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'kansas'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'oklahoma'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'missouri'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'indiana'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'north dakota'] <- 'deepskyblue'
worldgovt$col[worldgovt$region == 'illinois'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'california'] <- 'deeppink2'
worldgovt$col[worldgovt$region == '?'] <- 'purple'
worldgovt$col[worldgovt$region == 'wisconsin'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'south dakota'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'minnesota'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'iowa'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'louisiana'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'texas'] <- 'deepskyblue'
worldgovt$col[worldgovt$region == 'nebraska'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'colorado'] <- 'deeppink2'
worldgovt$col[worldgovt$region == 'new york'] <- 'mediumseagreen'
worldgovt$col[worldgovt$region == 'florida'] <- 'mediumseagreen'
worldgovt$col[worldgovt$region == 'vermont'] <- 'mediumseagreen'
worldgovt$col[worldgovt$region == 'connecticut'] <- 'mediumseagreen'
worldgovt$col[worldgovt$region == 'north carolina'] <- 'mediumseagreen'

table(worldgovt$col,worldgovt$region)

## Check for disagreements between the two datasets
diff <- setdiff(world$region, worldgovt$region)

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

ggplot(data = worldgovt, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = col)) +
  ggtitle("Kraemer-Worthington Adventures") +
  plain  + scale_fill_identity('',guide = 'legend',labels=c('A, A, & J','A&A','A+A','ACK','not yet'))
