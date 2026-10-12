{% macro get_season (X) %}

CASE WHEN MONTH(TO_TIMESTAMP({{X}})) in (12,1,2) THEN 'WINTER'
WHEN MONTH(TO_TIMESTAMP({{X}})) in (3,4,5) THEN 'SPRING'
WHEN MONTH(TO_TIMESTAMP({{X}})) in (6,7,8) THEN 'SUMMER'
ELSE 'AUTUMN'
END
{% endmacro %}


{% macro get_daytype(X)%}
CASE 
WHEN DAYNAME(TO_TIMESTAMP({{X}})) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END
{% endmacro%}