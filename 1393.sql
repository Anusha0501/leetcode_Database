#1393. Capital Gain/Loss

SELECT stock_name,
SUM(
Case
	When operation='Buy' then -price
	When operation='Sell' then price
End) 
As capital_gain_loss
FROM Stocks
Group By stock_name


