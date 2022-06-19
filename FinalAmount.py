def get_final_amount(amount):
     amount=float(amount[1:6])
     rate_of_tax=round(float(amount*0.08),1)
     finalamount=amount+rate_of_tax
     return finalamount