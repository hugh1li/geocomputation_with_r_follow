library(sp)

wor1d_sp <- as(world, Class = 'Spatial')

world_sf <- st_as_sf(wor1d_sp)

plot(world['pop'])

asia <- world[world$continent == 'Asia', ]
asis = st_union(asia)

plot(world['pop'], reset = FALSE)

plot(asis, add = TRUE, col = 'red')

plot(world['continent'], reset = FALSE)
cex = sqrt(world$pop) / 10000
world_cents = st_centroid(world, of_largest = TRUE)
plot(st_geometry(world_cents), add= TRUE, cex = cex)

st_point(c(5, 2))
st_point(c(5, 2, 3)) %>% plot()

st_point(c(5, 2, 1), dim = 'XYM')
st_point(c(5, 2, 3, 1))

# restart on 09/04
library(sf)
library(raster)
library(spData)
library(spDataLarge)

