require 'spec_helper'

describe DynamicFinderMatch do
  describe 'find_by_first_name' do
    let(:match) { DynamicFinderMatch.new(:find_by_first_name) }

    it 'should have attribute :firstname' do
      expect(match.attr).to eq(:first_name)
    end

    it 'should be a match' do
      match.should be_a_match
    end
  end
end  
