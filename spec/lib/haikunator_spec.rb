require_relative "../spec_helper"

describe Haikunator do
  it "generates a name like still-silence-5012" do
    name = Haikunator.haikunate

    expect(name).to match(/\A\w+-\w+-\d{1,4}\z/)
  end

  it "won't return the same name for subsequent calls" do
    name1 = Haikunator.haikunate
    name2 = Haikunator.haikunate

    expect(name1).not_to eql(name2)
  end

  it "permits optional configuration of the token range" do
    name = Haikunator.haikunate(9)

    expect(name).to match(/-\d{1}\z/)
  end

  it "drops the token if token range is 0" do
    name = Haikunator.haikunate(0)

    expect(name).to match(/\A\w+-\w+\z/)
  end

  it "permits optional configuration of the delimiter" do
    name = Haikunator.haikunate(9999, ".")

    expect(name).to match(/\A\w+\.\w+\.\d{1,4}\z/)
  end

  it "drops the token and delimiter if token range is 0 and delimiter empty space" do
    name = Haikunator.haikunate(0, " ")

    expect(name).to match(/\A\w+ \w+\z/)
  end
  
  context "has excluded adjectives" do
    before do
      allow(Haikunator).to receive(:adjectives).and_return(["bad", "good"])
    end
    
    it "should only haikunate with the non-excluded adjective" do
      name = Haikunator.haikunate(0, " ", excluded_adjectives: ["bad"])
      name_adjective, name_noun = name.downcase.split(" ")
      
      expect(name_adjective).to eql("good")
    end
  end
  
  context "has excluded nouns" do
    before do
      allow(Haikunator).to receive(:nouns).and_return(["bad", "good"])
    end
    
    it "should only haikunate with the non-excluded adjective" do
      name = Haikunator.haikunate(0, " ", excluded_nouns: ["bad"])
      name_adjective, name_noun = name.downcase.split(" ")
      
      expect(name_noun).to eql("good")
    end
  end
end
