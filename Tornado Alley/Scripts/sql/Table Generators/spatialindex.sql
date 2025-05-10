SELECT *
FROM tornado_geo;

ALTER TABLE tornado_geo
ADD COLUMN start_geom geometry(Point, 4326);

-- Fill the geometry paths

UPDATE tornado_geo 
SET start_geom = ST_StartPoint(path_geom) 
WHERE path_geom IS NOT NULL;

-- Creates a spatial index for tornado_geo

CREATE INDEX idx_start_geom  -- You can name the index descriptively
ON tornado_geo
USING GIST (start_geom);

-- Create a spatial index for uscounties

CREATE INDEX idx_counties_geom
ON counties_geo -- Or your actual county table name
USING GIST (geom); -- Use actual county geom column
