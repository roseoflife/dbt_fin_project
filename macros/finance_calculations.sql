{% macro calculate_margin(numerator, denominator) %}
       CASE
           WHEN {{ denominator }} = 0 THEN NULL
           ELSE ({{ numerator }} / {{ denominator }}) * 100
       END
   {% endmacro %}

   {% macro calculate_gross_margin(revenue, cogs) %}
       CASE
           WHEN {{ revenue }} = 0 THEN NULL
           ELSE ({{ revenue }} - {{ cogs }}) / {{ revenue }} * 100
       END
   {% endmacro %}