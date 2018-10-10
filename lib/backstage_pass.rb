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

  def update_backstage_pass_quality
    if @sell_in > 10
      @quality += 1 unless max_quality?

    elsif (6..10).include?(@sell_in)
      @quality += 1 if @quality == 49
      @quality += 2 unless max_quality?

    elsif (1..5).include?(@sell_in)
      @quality = 50 if @quality >= 48
      @quality += 3 unless max_quality?

    else
      @quality = 0
    end
  end

  def max_quality?
    @quality == 50
  end

end
