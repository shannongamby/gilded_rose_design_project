require 'gilded_rose'

describe GildedRose do

  let(:items) { double :items }

  it "should respond to #update_quality" do
    subject = GildedRose.new([items])
    expect(subject).to respond_to(:update_quality)
  end

  it "passes when #update_quality is called and item receives #update" do
    item = spy('item')
    subject = GildedRose.new([item])
    subject.update_quality
    expect(item).to have_received(:update)
  end
end
