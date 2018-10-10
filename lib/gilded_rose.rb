class GildedRose

  def initialize(items)
    @items = items
    @special_cases = ["Aged Brie", "Sulfuras, Hand of Ragnaros", "Backstage passes to a TAFKAL80ETC concert", "Conjured"]
  end

  def update_quality
    update_by_name
    reduce_sell_in
  end

  def update_by_name
    @items.each { |item|
      if @special_cases.include?(item.name)
        item.update
      else
        update_generic
      end
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
