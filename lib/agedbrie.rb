class AgedBrie
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update_brie_quality
    @quality += 1 if @quality == 49

    if @sell_in <= 0 ? true : false
      @quality += 2 unless @quality == 50? true : false
    else
      @quality += 1 unless @quality == 50? true : false
    end
  end

end
