require 'json'

class GroupCollection

  def initialize
    @groups = Array.new
  end

  def today(clock=Date)
    @groups.select { |g| g.meeting_wday == clock.today.wday }
  end

  def <<(group)
    @groups << group
  end

  def to_json
    @groups.collect do |group|
      group.attributes
    end.to_json
  end
end
