require 'spec_helper_lite'
require 'group_collection'
require 'group'

describe GroupCollection do
  describe '#today' do
    it 'lists the groups that are happening today' do
      groups = GroupCollection.new
      groups << double(:meeting_wday => 1)
      groups << double(:meeting_wday => 1)
      groups << double(:meeting_wday => 2)
      clock = double(:today => Date.new(2014, 5, 5))
      expect(groups.today(clock).count).to eq 2
    end
  end

  describe '#to_json' do
    it "should return a json representation of the collection of groups" do
      groups = GroupCollection.new
      groups << Group.new(:name => "Test Group", :address => "123", :meeting_wday => 2)
      expect(groups.to_json).to eq('[{"name":"Test Group","address":"123","city":null,"state":null,"zip":null,"email":null,"phone":null,"meeting_wday":2}]')
    end
  end
end

