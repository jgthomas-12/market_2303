class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    if !@vendors.include?(vendor)
      @vendors << vendor
    end
  end

  def vendor_names
  @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory[item]
    end
  end

end