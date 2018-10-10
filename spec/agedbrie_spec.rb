require 'agedbrie'

describe AgedBrie do

  it "does not change the name of Aged Brie" do
    item = AgedBrie.new("Aged Brie", 0, 0)
    item.update_brie
    expect(item.name).to eq "Aged Brie"
  end

  it 'raises quality by one after a day' do
    item = AgedBrie.new("Aged Brie", 1, 0)
    item.update_brie
    expect(item.quality).to eq(1)
  end

  it 'never raises quality beyond 50' do
    item = AgedBrie.new("Aged Brie", 1, 50)
    item.update_brie
    expect(item.quality).to eq(50)
  end

  it 'raises quality by two after a day' do
    item = AgedBrie.new("Aged Brie", 0, 0)
    item.update_brie
    expect(item.quality).to eq(2)
  end

  it 'only raises quality to 50 when quality is at 49' do
    item = AgedBrie.new("Aged Brie", 0, 49)
    item.update_brie
    expect(item.quality).to eq(50)
  end

end
