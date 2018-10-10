require 'conjured'

describe Conjured do

  it "does not change the name" do
    item = Conjured.new("Conjured", 0, 0)
    item.update_conjured
    expect(item.name).to eq "Conjured"
  end

  it "lowers the quality by two after one day" do
    item = Conjured.new("Conjured", 1, 2)
    item.update_conjured
    expect(item.quality).to eq 0
  end

  it "never lowers quality below 0" do
    item = Conjured.new("Conjured", 0, 0)
    item.update_conjured
    expect(item.quality).to eq(0)
  end

end
