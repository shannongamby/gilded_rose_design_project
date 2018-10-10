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
        update_brie(item) if item.name == "Aged Brie"
        update_sulfuras(item) if item.name == "Sulfuras, Hand of Ragnaros"
        update_backstage_pass(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_generic if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" and item.name != "Sulfuras, Hand of Ragnaros"
      }
  end

  def update_brie(item)
    item.update_brie_quality
  end

  def update_sulfuras(item)
    item.update_sulfuras_quality
  end

  def update_backstage_pass(item)
    item.update_backstage_pass_quality
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
      item.sell_in <= 0
  end

  def zero_quality?(item)
    item.quality == 0
  end

end
