class Loan
  def initialize conditions
    @conditions = conditions
  end

  def result
    @result
  end

  def calculate
    @result = {}

    amount = remaining_body = @conditions['amount'].to_f
    period = @conditions['period'].to_i
    year_rate = @conditions['rate'].to_f / 100
    body_month_part = amount / period
    month_rate = year_rate / 12

    payments_table = @result[:payments_table] = []
    @result[:overpayment] = 0
    period.times do
      credit_tax = remaining_body * month_rate
      payments_table << {
        remaining_body: remaining_body,
        body_month_part: body_month_part,
        credit_tax: credit_tax,
        to_pay: body_month_part + credit_tax
      }
      remaining_body -= body_month_part
      @result[:overpayment] += credit_tax
    end
  end
end
