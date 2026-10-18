WITH TRIPS AS (

select
RIDE_id,
-- RIDEABLE_TYPE,
DATE(TO_TIMESTAMP(STARTED_AT)) as Trip_Date,
start_statio_id as Start_station_id,
End_station_id,
MEMBER_CSUAL as Member_CSUAL,
TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(started_at),TO_TIMESTAMP(Ended_at)) as Trip_Duration_Seconds
from {{ ref('stg_bike') }}
where RIDE_id != 'bikeid' AND RIDE_ID !='"bikeid"'
)

SELECT * FROM TRIPS