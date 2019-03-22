SELECT CONCAT('{name:''', m, ''',id:', '''', m, ''',data:[', group_concat(c), ']}') as r
from (SELECT monthname(created_at) as m, concat('[''', dish_name, ''',', COUNT(dish_name), ']') c
      FROM rms_orders
             inner join rms_order_items on rms_order_items.order_id = rms_orders.order_id
      GROUP by dish_name) as c
GROUP by m;

SELECT CONCAT('{name:''', m, ''',id:', '''', m, ''',data:[', group_concat(C), ']}')
FROM ((SELECT YEAR(BP.OR_DATE)     AS CURRYEAR,
              SUM(OR_TOTAL_AMOUNT) AS AMT,
              MONTHNAME(OR_DATE)
       FROM bpls_t_official_receipt BP)
      UNION ALL
      (SELECT YEAR(MT.OR_DATE)     AS CURRYEAR,
              SUM(OR_TOTAL_AMOUNT) AS AMT,
              MONTHNAME(OR_DATE)
       FROM mtops_t_official_receipt MT)) AS C;

SELECT C
FROM (SELECT YEAR(BP.OR_DATE)AS CURRYEAR,
    SUM(OR_TOTAL_AMOUNT) AS AMT,
    MONTHNAME(OR_DATE) AS MONTHS
       FROM bpls_t_official_receipt BP)
UNION ALL
(SELECT YEAR(MT.OR_DATE)     AS CURRYEAR,
        SUM(OR_TOTAL_AMOUNT) AS AMT,
        MONTHNAME(OR_DATE) MONTHS
 FROM mtops_t_official_receipt MT);

(SELECT CONCAT('{name:''',YEARS, ''',id:', '''', YEARS, ''',data:[', GROUP_CONCAT(PERMONTH), ']}') AS YRDRILLDN FROM (SELECT concat('[''', MONTHS, ''',', SUM(TOTAL), ']') AS PERMONTH,YEARS,Module FROM(SELECT YEAR(BP.OR_DATE) AS YEARS,MONTHNAME(BP.OR_DATE) AS MONTHS,SUM(BP.OR_TOTAL_AMOUNT) AS TOTAL,'BPLS' AS Module
 FROM bpls_t_official_receipt BP GROUP BY MONTH(OR_DATE)
UNION ALL
SELECT YEAR(MT.OR_DATE) AS YEARS,MONTHNAME(MT.OR_DATE) AS MONTHS,SUM(MT.OR_TOTAL_AMOUNT) AS TOTAL,'MTOPS' AS Module
 FROM mtops_t_official_receipt MT GROUP BY MONTH(OR_DATE)) AS X GROUP BY MONTHS) AS V GROUP BY YEARS);

SELECT * FROM ((SELECT YEAR(BP.OR_DATE) AS CURRYEAR,SUM(OR_TOTAL_AMOUNT) AS AMT FROM bpls_t_official_receipt BP) UNION ALL (SELECT YEAR(MT.OR_DATE) AS CURRYEAR, SUM(OR_TOTAL_AMOUNT) AS AMT FROM mtops_t_official_receipt MT)) AS C GROUP BY CURRYEAR;

SELECT YR,SUM(AMT), CONCAT('{name:''',YR, ''',y:', SUM(AMT),',drilldown:''', YR,'''}') FROM ((SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM bpls_t_official_receipt BP
UNION ALL
SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM mtops_t_official_receipt MT) AS CX) GROUP BY YR;

(SELECT CONCAT('{name:''',YEARS, ''',id:', '''', YEARS, ''',data:[', GROUP_CONCAT(PERMONTH), ']}') AS YRDRILLDN FROM (SELECT concat('[''', MONTHS, ''',', SUM(TOTAL), ']') AS PERMONTH,YEARS,Module FROM(SELECT YEAR(BP.OR_DATE) AS YEARS,MONTHNAME(BP.OR_DATE) AS MONTHS,SUM(BP.OR_TOTAL_AMOUNT) AS TOTAL,'BPLS' AS Module FROM bpls_t_official_receipt BP GROUP BY MONTH(OR_DATE) UNION ALL SELECT YEAR(MT.OR_DATE) AS YEARS,MONTHNAME(MT.OR_DATE) AS MONTHS,SUM(MT.OR_TOTAL_AMOUNT) AS TOTAL,'MTOPS' AS Module FROM mtops_t_official_receipt MT GROUP BY MONTH(OR_DATE)) AS X GROUP BY MONTHS ORDER BY MONTHS) AS V GROUP BY YEARS )