class EventAggregatorService
  def initialize; end

  def aggregate_events
    Ahoy::Event
      .where(name: 'Ran action')
      .where('time > ?', 7.days.ago)
      .where_properties(controller: 'watches')
      .group_by_hour(:time)
      .count
  end
end
