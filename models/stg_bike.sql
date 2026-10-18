WITH BIKE AS (

SELECT 
RIDE_ID ,
		REPLACE(STARTED_AT,'"','') AS STARTED_AT,
		REPLACE(ENDED_AT,'"','') AS ENDED_AT,
		START_STATION_NAME ,
		START_STATIO_ID ,
		END_STATION_NAME ,
		END_STATION_ID ,
		START_LAT ,
		START_LNG ,
		END_LAT ,
		END_LNG ,
		MEMBER_CSUAL
FROM {{ source('demo', 'bike') }}
Where ride_id != '"bikeid"' and started_at !='"starttime"' AND started_at !='starttime'
)

SELECT * FROM bike