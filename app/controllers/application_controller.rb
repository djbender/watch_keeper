class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  after_action :track_action

  protected

  def track_action
    ahoy.track 'Ran action', request.path_parameters
  end
end
