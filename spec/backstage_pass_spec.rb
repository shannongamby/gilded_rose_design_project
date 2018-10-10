require 'backstage_pass'
describe BackstagePass do

  it 'increases quality by one after each day' do
    item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 15, 0)
    item.update_backstage_pass_quality
    expect(item.quality).to eq(1)
  end

  it 'never increases quality beyond 50' do
    item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 15, 50)
    item.update_backstage_pass_quality
    expect(item.quality).to eq(50)
  end


  it 'increases quality by two after each day' do
    item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)
    item.update_backstage_pass_quality
    expect(item.quality).to eq(2)
  end

  it 'only raises quality to 50 when quality is at 49' do
    item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)
    item.update_backstage_pass_quality
    expect(item.quality).to eq(50)
  end


  it 'increases quality by three after each day' do
    item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 0)
    item.update_backstage_pass_quality
    expect(item.quality).to eq(3)
  end

  it 'only raises quality to 50 when quality is at 48 or more' do
    item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
    item.update_backstage_pass_quality
    expect(item.quality).to eq(50)
  end

end
