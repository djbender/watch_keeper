class EventAggregatorService
  def initialize; end

  def aggregate_events
    Ahoy::Event
      .where(name: 'Ran action')
      .where('time > ?', 24.hours.ago)
      .where_properties(controller: 'watches')
      .group_by_minute(:time)
      .count
  end
end
