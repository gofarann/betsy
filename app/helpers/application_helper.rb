module ApplicationHelper
  def nice_price(price)
    price = price / 100.0
    number_to_currency(price)
  end
end
