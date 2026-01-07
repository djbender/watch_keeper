# Disable strict_loading for SolidQueue models to avoid warnings
# when accessing associations in the queue worker
Rails.application.config.after_initialize do
  if defined?(SolidQueue)
    SolidQueue::Record.strict_loading_by_default = false
  end
end
