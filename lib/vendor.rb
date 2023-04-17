class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, amount)
    if @inventory.include?(item)
      @inventory[item] += amount
    else
      @inventory[item] = amount
    end
  end

  def potential_revenue
    one = @inventory.map do |item|
      item_price_float = item[0].price.delete("$").to_f
      pot_rev = item[1] * item_price_float
    end
    one.sum
  end

end