require 'gilded_rose'

describe GildedRose do

  let(:item) { double :item }
  subject { described_class.new([item]) }

  it "should respond to #update_quality" do
    allow(item).to receive(:update)
    expect(subject.update_quality).to eq([item])
  end
end
