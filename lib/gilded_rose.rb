class GildedRose

  def initialize(items)
    @items = items
    @special_cases = ["Aged Brie", "Sulfuras, Hand of Ragnaros", "Backstage passes to a TAFKAL80ETC concert"]
  end

  def update_quality
    update_by_name
    reduce_sell_in
  end

  def update_by_name
    @items.each { |item|
      item.update_brie if item.name == @special_cases[0]
      item.update_sulfuras if item.name == @special_cases[1]
      item.update_backstage_pass if item.name == @special_cases[2]
      update_generic unless @special_cases.include?(item.name)
    }
  end

  def update_generic
    @items.each { |item|
      if after_sell_in?(item)
        item.quality -= 2 unless zero_quality?(item)
      else
        item.quality -= 1 unless zero_quality?(item)
      end
    }
  end

  def reduce_sell_in
    @items.each { |item|
      item.sell_in -= 1 unless item.name == @special_cases[1]
    }
  end

  def after_sell_in?(item)
    item.sell_in <= 0
  end

  def zero_quality?(item)
    item.quality.zero?
  end

end
