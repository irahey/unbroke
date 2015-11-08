module QuizzesHelper
    
    def total_expenses
        other_bills = @quiz.other_bills 
        leisure = @quiz.leisure
        debt_repay_value = @quiz.debt_repay_value
        house_bills = @quiz.house_bills
        car_bills = @quiz.car_bills
        (other_bills + leisure + debt_repay_value + house_bills + car_bills).round(1)
        #"Your monthly expenses total up to: $" + (@quiz.total_bills + @quiz.leisure + @quiz.debt_repay_value + @quiz.mortgage + @quiz.car_bills).round(1)
    end

        
    def total_expenses_eval
        abc = total_expenses
        income = @quiz.income
        if abc > income
            "You are spending more than what you earn. " + leisure_eval
        elsif abc < (0.9*income)
            "Good job! You are living within your means and you spare at least 10% of your income for savings or as contingency fund for unexpected monthly expenses. "
        else
            "Good job! You are living within your means. "
        end
    end
    def leisure_eval
        leisure = @quiz.leisure
        income = @quiz.income
        if leisure > 0.1*income
            "And out of your total expenses, you are spending more than 10% of your monthly income on leisure. Cutting your leisure expenses down could free up some budget. "
        else
            ""
        end
    end
    
    def car_bills_eval
        car_bills = @quiz.car_bills
        if car_bills > 0.4*income
            "You are spending more than 40% of your income for your car."
        else
            "Your monthly car expenses are under control!"
        end
    end

    
    def total_loans
        student_loan = @quiz.student_loan
                personal_loan = @quiz.personal_loan
        medical_loan = @quiz.medical_loan
        car_loan = @quiz.car_loan  
        (student_loan + personal_loan + medical_loan + car_loan).round(1)
    end
    def total_loans_eval
        abc = total_loans
        income = @quiz.income
        debt_repay = @quiz.debt_repay
        debt_repay_value = @quiz.debt_repay_value
        income60 = "Your total loans, excluding house and car loans, are more than 5 times your current annual income. "
        income36 = "Your total loans, excluding house and car loans, are less than 3 times your current annual income. "
        income12 = "Your total loans, excluding house and car loans, is only less than a year's worth of your current annual income. "
        income6 = "Your total loans, excluding house and car loans, is only less than half a year's worth of your current annual income. "
        debtfree = "Congratulations on being debt-free! "
        if abc > 60*income
            income60 + debt_repay_eval(debt_repay, debt_repay_value)
        elsif abc > 36*income
            income36 + debt_repay_eval(debt_repay, debt_repay_value)
        elsif abc == 0
            debtfree
        elsif abc < 6*income
            income6 + debt_repay_eval(debt_repay, debt_repay_value)
        elsif abc < 12*income
            income12 + debt_repay_eval(debt_repay, debt_repay_value)

        end
    end

        
    def debt_repay_eval(debt_repay, debt_repay_value)
        debt_repay = @quiz.debt_repay
        debt_repay_value = @quiz.debt_repay_value
        debt_repay_true =  "It is good that you already have a debt repayment program in place. All you need to do is pay for your debt diligently and soon enough, you're going to be debt-free! "
        debt_repay_false =  "It is recommended to have a debt repayment plan or program in place. You can make your own payment plan or you may visit your bank and set an appointment with any of their financial advisors. "
        if debt_repay == true
            debt_repay_value_eval(debt_repay_value) + "Nonetheless... " + debt_repay_true
        else
            debt_repay_false
        end
    end
    def debt_repay_value_eval(debt_repay_value)
        debt_repay_value = @quiz.debt_repay_value
        income = @quiz.income
        abc = "Your debt payments should not exceed 40% of your net income. "
        abc2 = "There is nothing wrong with using loans to buy a home, finance a car or get an education. But to stay our of trouble, your debt payments should not exceed 40% of your net income. "
        if debt_repay_value < 0.4*income
            "You've got your debt under control! " + abc
        else
            "You are carrying too much debt. " + abc2
        end
    end

    
    
    def esavings_p
        income = @quiz.income
        esavings = @quiz.esavings
        abc = income/esavings
        return abc.round(1)
    end

        
    def total_investments
        (@quiz.esavings + @quiz.rsavings + @quiz.investments).round(1)
    end
    def total_investments_eval
        good_job = "Keep up the good work and continue saving up and investing for the future! "
        no_svgs = "You need to think about saving money for the future. Once you have the chance to adjust your budget, it wouldn't be a bad idea to start saving up for the future! "
        if total_investments == 0
            no_svgs
        else
            "Your total savings and investments is: $" + total_investments.to_s + ". " + good_job
        end
    end
    def esavings_eval
        abc2 = esavings_p
        
        abc = "It is recommended to keep at least 3 months worth of expenses or a high-yield money market fund for emergencies. "

        if abc2 < 3
            "You also have enough emergency savings. " + abc
        else 
            "You might want to try to save up a little bit more. " + abc
        end
    end



    def house_eval
        house_monthly = @quiz.house_bills
        house_value = @quiz.house_value
        income = @quiz.income
        exp = total_expenses
        good_rent = "Your monthly rental expenses are under control! "
        fancy_rent = "You are spending more than 60% of your income for your monthly rent but you must have your own reasons for staying there. Remember that you can always adjust your budget by spending less in other areas such as groceries, leisure and car. "
        okay_rent = "You are spending more than 60% of your income for your monthly rent. If you don't have any other reasons for staying there, it's not a bad idea to look for a more affordable place! "
        good_mortgage = "Your monthly amortization expenses are under control! "
        fancy_house = "You are spending more than 30% of your income for your monthly amortization but you must have your own reasons for staying there. Remember that you can always adjust your budget by spending less in other areas such as groceries, leisure and car. "
        okay_mortgage = "You are spending more than 30% of your income for your monthly amortization. If you don't have any other reasons for staying there, it's not a bad idea to look for a more afforbable house! "
        msg = "It is recommended that housing payments should not exceed more than 30% of your net monthly income. However housing prices have increased significantly over the past few years and a lot of homebuyers have broken this rule of thumb. "
        if house_value == 0
            if (house_monthly < 0.6*income)
                good_rent
            elsif (house_monthly > 0.6*income) && (exp > income)
                fancy_rent
            else
                okay_rent
            end
        else
            if (house_monthly < 0.3*income)
                good_mortgage
            elsif (house_monthly > 0.3*income) && (exp > income)
                fancy_house + msg
            else
                okay_mortgage + msg
            end
        end
    end
end
