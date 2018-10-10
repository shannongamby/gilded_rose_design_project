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

  def update_brie
    @quality += 1 if @quality == 49

    if sell_in.zero?
      @quality += 2 unless max_quality?
    else
      @quality += 1 unless max_quality?
    end
  end

  def max_quality?
    @quality == 50
  end
  
end
