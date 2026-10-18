WITH daily_weather as 
(

SELECT
date(time) as daily_weather,
weather,
temp,
humidity,
clouds,
pressure
 FROM {{ source('demo', 'weather') }}
LIMIT 10

),

daily_weather_agg as (
select
daily_weather,
weather,
round(avg(temp),2) as avg_temp,
round(avg(humidity),2) as avg_humidity,
round(avg(pressure),2) as avg_pressure,
round(avg(clouds),2) as avg_clouds
from daily_weather
group by daily_weather,weather
qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc ) = 1
)




SELECT * FROM daily_weather_agg