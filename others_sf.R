# others about sf 
library(sf)

st_is_simple(st_point(0:1))

gpkg = system.file('gpkg/nc.gpkg', package = 'sf')
options(pillar.sigfig = 3)
read_sf(gpkg) %>% select(1:3, 12)

read_sf(gpkg) %>% select(1:5, 12) %>% st_transform(2264)

library(ggplot2)

nc <- read_sf(gpkg) %>% st_transform(2264)

ggplot() + geom_sf(data = nc) + aes(fill = BIR74) + theme(panel.grid.major = element_line(color = 'white')) + scale_fill_gradientn(colors = sf.colors(20))

library(tidyr)
nc2 <- nc %>% select(SID74, SID79) %>% gather(VAR, SID, - geom)
ggplot() + geom_sf(data = nc2, aes(fill = SID)) + facet_wrap(~VAR, ncol =1) +scale_y_continuous(breaks = 34:36) + scale_fill_gradientn(colors =sf.colors(20))  + theme(panel.grid.major = element_line(color = 'white'))

library(mapview)
nc %>% mapview(zcol = 'BIR74', legend = TRUE, col.regions = sf.colors)

pts <- rbind(c(0, 80), c(120, 80), c(240, 80), c(0, 80))

pol = st_sfc(st_polygon(list(pts)), crs = "+proj=longlat")

library(units)
pol %>% st_area %>% set_units(km^2)

pol %>% st_transform("+proj=eqc") %>% st_area

pol %>% st_set_crs(NA) %>% st_area

pts = st_sfc(st_point(c(0, 90)), st_point(c(0, 70)), st_point(c(60, 70)), crs = '+proj=longlat')

st_distance(pol, pts) %>% set_units(km)
             
tif = system.file('tif/L7_ETMs.tif', package = 'stars')
plot(st_stars(tif), main = paste('Band', 1:6), col = grey(1:9/10))
