WITH last_rate AS
  (SELECT *
   FROM currency
   WHERE updated =
       (SELECT max(updated)
        FROM currency)),
     sum_money AS
  (SELECT user_id,
          sum(MONEY) volume,
          TYPE,
          currency_id
   FROM balance
   GROUP BY user_id,
            TYPE,
            currency_id)
SELECT CASE
           WHEN public.user.name IS NULL THEN 'not defined'
           ELSE public.user.name
       END,
       CASE
           WHEN lastname IS NULL THEN 'not defined'
           ELSE lastname
       END,
       TYPE,
       sum_money.volume,
       CASE
           WHEN last_rate.name IS NULL THEN 'not defined'
           ELSE last_rate.name
       END currency_name,
       CASE
           WHEN last_rate.rate_to_usd IS NULL THEN 1
           ELSE last_rate.rate_to_usd
       END last_rate_to_usd,
       volume * CASE
                    WHEN last_rate.rate_to_usd IS NULL THEN 1
                    ELSE last_rate.rate_to_usd
                END total_volume_in_usd
FROM sum_money
FULL JOIN public.user ON public.user.id = sum_money.user_id
FULL JOIN last_rate ON last_rate.id = sum_money.currency_id
ORDER BY 1 DESC,
         2,
         3