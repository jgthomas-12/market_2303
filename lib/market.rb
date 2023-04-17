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

  def sorted_items_list
    items = @vendors.map do |vendor|
      item_names = vendor.inventory.select do |item|
        item.name
      end
      names = item_names.map do |item|
        item[0].name
      end
      names
    end.flatten
    items
  end

end