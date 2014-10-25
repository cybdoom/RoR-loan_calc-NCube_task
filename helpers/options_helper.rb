class OptionsHelper
  def self.amount_units_options
    options_to_html ['%', 'amount']
  end

  def self.rate_units_options
    options_to_html ['amount', '% of the total amount', '% of the remaining amount']
  end

  private

  def self.options_to_html options_array
    options_array.reduce('') {|acc, e| acc += '<option>' + e + '</option>' }
  end
end
