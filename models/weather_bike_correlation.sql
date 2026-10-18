WITH CTE AS (

SELECT t.*,
w.*
from {{ ref('trip_fact') }} t
left join {{ ref('daily_weather') }} w
on t.Trip_Date = w.daily_weather
)


SELECT * FROM CTE