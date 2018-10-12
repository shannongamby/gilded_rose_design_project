class MagicBean

  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality, random = Random.new)
    @name = name
    @sell_in = sell_in
    @quality = quality
    @random = random
  end

  def update
    @quality -= @random.rand(0..1) unless @quality.zero?
  end
end
