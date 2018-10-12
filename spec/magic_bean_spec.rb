require 'magic_bean'
describe MagicBean do

  let(:random) { double :random }
  subject { described_class.new("magic bean", 0, 1, random) }

  context "when random number is 1" do
    it "should decrease quality by 1" do
      allow(random).to receive(:rand) { 1 }
      subject.update
      expect(subject.quality).to eq 0
    end
  end

  context "when random number is 0" do
    it "should decrease quality by 0" do
      allow(random).to receive(:rand) { 0 }
      subject.update
      expect(subject.quality).to eq 1
    end
  end
end
