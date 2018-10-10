class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    update_by_name
    reduce_sell_in
  end

  def update_by_name
      @items.each { |item|
        update_brie if item.name == "Aged Brie"
        update_sulfuras if item.name == "Sulfuras, Hand of Ragnaros"
        update_backstage_pass if item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_generic if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" and item.name != "Sulfuras, Hand of Ragnaros"
      }
  end

  def update_brie
    @items.each { |item|
      item.quality += 1 if item.quality == 49

      if after_sell_in?(item)
        item.quality += 2 unless max_quality?(item)
      else
        item.quality += 1 unless max_quality?(item)
      end
    }

  end

  def update_sulfuras
    @items.each { |item|
      item
    }
  end

  def update_backstage_pass
    @items.each { |item|
      if item.sell_in > 10
        item.quality += 1 unless max_quality?(item)

      elsif (6..10).include?(item.sell_in)
          item.quality += 1 if item.quality == 49
          item.quality += 2 unless max_quality?(item)

      elsif (1..5).include?(item.sell_in)
          item.quality = 50 if item.quality >= 48
          item.quality += 3 unless max_quality?(item)

      else
        item.quality = 0
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
      item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
    }
  end

  def after_sell_in?(item)
      item.sell_in <= 0 ? true : false
  end

  def max_quality?(item)
    item.quality == 50? true : false
  end

  def zero_quality?(item)
    item.quality == 0? true : false
  end

end
