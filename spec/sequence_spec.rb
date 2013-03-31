require 'rspec'

require_relative '../lib/sequence'

describe Sequence do
  subject{Sequence.new(data)}

  context "simple matching" do
    let(:data) {"AATAACG"}

    it "should match AAT" do
      subject.match("AAT", "<", ">")
      subject.with_delimiters.should == "<AAT>AACG"
    end

    it "should match multiple occurences" do
      subject.match("AA", "<", ">")
      subject.with_delimiters.should == "<AA>T<AA>CG"
    end
  end

  context "crossover matching" do
    let(:data){"AATAATACG"}

    it "should match multiple occurences" do
      subject.match("AATA", "<", ">")
      subject.with_delimiters.should == "<AAT<A>ATA>CG"
    end
  end

  context "matching different signals" do
    let(:data){"AATCCG"}
    it "should match two different signals" do
      subject.match("AAT", "<", ">")
      subject.match("CCG", "{", "}")
      subject.with_delimiters.should == "<AAT>{CCG}"
    end

    it "should match two different signals with crossover" do
      subject.match("AAT", "<", ">")
      subject.match("TCC", "{", "}")
      subject.with_delimiters.should == "<AA{T>CC}G"
    end
  end
end