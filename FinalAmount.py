

def calculate_final_amount(price_list):
     amount=float(0)
     for price in price_list:
          amount=float(float(price[1:6])+amount)
     rate_of_tax=float(amount*0.08)
     finalamount=round(amount+rate_of_tax,2)
     return finalamount