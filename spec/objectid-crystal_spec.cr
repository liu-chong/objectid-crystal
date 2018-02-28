require "./spec_helper"

describe ObjectId do
  it "works" do
    ObjectId.new.size.should eq 19
    ObjectId.new(Time.now.epoch, 16).size.should eq 24
  end

  it "check" do
    ids = Array(String).new
    99999.times { |i|
      timestamp = Time.now.epoch
      id = ObjectId.new timestamp
      id.size.should eq 19
      id16 = BigInt.new(id, 36).to_s(16)
      id16.size.should eq 24
      id16[0,8].to_i(16).should eq timestamp
      ids << id
      id.should be > ids[i - 1] if i > 0
    }
    ids.uniq.size.should eq 99999
  end
end