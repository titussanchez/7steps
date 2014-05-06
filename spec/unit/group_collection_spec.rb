require 'spec_helper_lite'
require 'group_collection'

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
end

