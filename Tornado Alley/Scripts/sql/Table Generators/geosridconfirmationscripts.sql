SELECT *
FROM tornado_geo;

-- Getting the SRID 

SELECT ST_SRID(geom) FROM tornado_geo LIMIT 1;

-- Checking the geometry type of each 

SELECT DISTINCT ST_GeometryType(geom)
FROM tornado_geo
WHERE geom IS NOT NULL -- To Ignore any null geometries
LIMIT 100; -- Check the types in the first 100 non-null rows


SELECT *
FROM counties_geo;

SELECT ST_SRID(geom) FROM counties_geo LIMIT 1;

SELECT DISTINCT ST_GeometryType(geom)
FROM counties_geo
WHERE geom IS NOT NULL -- Ignore any null geometries
LIMIT 100; -- Check the types in the first 100 non-null rows


-- Creates indexes for the counties_geo table
CREATE INDEX idx_counties_geojson_geom ON counties_geo USING GIST (geom);
