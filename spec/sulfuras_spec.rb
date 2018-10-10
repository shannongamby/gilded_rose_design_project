require 'sulfuras'
describe Sulfuras do

  it "does not change the name" do
    item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 1, 80)
    item.update
    expect(item.name).to eq "Sulfuras, Hand of Ragnaros"
  end

  it 'does not change sell_in' do
    item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 1, 80)
    item.update
    expect(item.sell_in).to eq(1)
  end

  it 'does not change quality' do
    item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 1, 80)
    item.update
    expect(item.quality).to eq(80)
  end

end
