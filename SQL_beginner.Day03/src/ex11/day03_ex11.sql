UPDATE menu SET price = round(price - 0.1 * price)
WHERE pizza_name = 'greek pizza';