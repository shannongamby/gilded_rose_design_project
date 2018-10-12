class BackstagePass
  
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update
    increase_quality_by_one if @sell_in > 10
    increase_quality_by_two if (6..10).cover?(@sell_in)
    increase_quality_by_three if (1..5).cover?(@sell_in)
    @quality = 0 if @sell_in <= 0
    reduce_sell_in
  end

  def increase_quality_by_one
    @quality += 1 unless max_quality?
  end

  def increase_quality_by_two
    @quality += 1 if @quality == 49
    @quality += 2 unless max_quality?
  end

  def increase_quality_by_three
    @quality = 50 if @quality >= 48
    @quality += 3 unless max_quality?
  end

  def reduce_sell_in
    @sell_in -= 1
  end

  def max_quality?
    @quality == 50
  end

end
