class GroupCollection
  def today(clock=Date)
    @groups.select { |g| g.meeting_wday == clock.today.wday }
  end

  def <<(group)
    @groups ||= Array.new
    @groups << group
  end
end
