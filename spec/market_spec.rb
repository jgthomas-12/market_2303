require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'


RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")

    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: "Peach", price: "$0.75"})
    @item2 = Item.new({name: "Tomato", price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe "initialize" do
    it "exists" do
      expect(@market).to be_an(Market)
    end

    it "has readable attributes" do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it "vendors to be an empty array when instantiated" do
      expect(@market.vendors).to eq([])
    end

  end

  describe "#add_vendor" do
    it "can add a vendor to @vendors" do
      @vendor1.stock(@item1, 35)
      @market.add_vendor(@vendor1)
      expect(@market.vendors).to eq([@vendor1])
    end

    it "can add multiple vendors to @vendors" do
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end

  describe "#vendor_names" do
    it "can return a vendor's name" do
      @vendor1.stock(@item1, 35)
      @market.add_vendor(@vendor1)
      expect(@market.vendors[0].name).to eq("Rocky Mountain Fresh")
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh"])
    end

    it "can return all vendor's name in an array" do
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe "#vendors_that_sell" do
    it "can find a vendor that sells an item and returns an array" do
      @vendor1.stock(@item1, 35)
      @market.add_vendor(@vendor1)
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1])
    end

    it "can return all vendor's that sell a specific item" do
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end

 


end