class Generic

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
    @quality = 0 if @quality == 1
    unless @quality.zero?
      @quality -= 2 if @sell_in <= 0
      @quality -= 1 if @sell_in > 0
    end
    reduce_sell_in
  end

  def reduce_sell_in
    @sell_in -= 1
  end
end
