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

  def update_backstage_pass
    update_case_one if @sell_in > 10
    update_case_two if (6..10).cover?(@sell_in)
    update_case_three if (1..5).cover?(@sell_in)
    @quality = 0 if @sell_in <= 0
  end

  def update_case_one
    @quality += 1 unless max_quality?
  end

  def update_case_two
    @quality += 1 if @quality == 49
    @quality += 2 unless max_quality?
  end

  def update_case_three
    @quality = 50 if @quality >= 48
    @quality += 3 unless max_quality?
  end

  def max_quality?
    @quality == 50
  end

end
