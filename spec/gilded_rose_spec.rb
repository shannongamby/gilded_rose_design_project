require 'gilded_rose'

describe GildedRose do

  let(:item) { double :item }

  it "should respond to #update_quality" do
    expect(GildedRose.new([item])).to respond_to(:update_quality)
  end
end
