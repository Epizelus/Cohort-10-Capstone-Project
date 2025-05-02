CREATE TABLE us_anomalies_20152020 AS (SELECT ID, Name, State, Value, Anomaly, Rank, Mean FROM ks_temp_avg)
UNION
SELECT ID, Name, State, Value, Anomaly, Rank, Mean FROM ok_temp_avg
UNION
SELECT ID, Name, State, Value, Anomaly, Rank, Mean FROM tx_temp_avg
UNION
SELECT ID, Name, State, Value, Anomaly, Rank, Mean FROM ok_temp_avg
ORDER BY ID;