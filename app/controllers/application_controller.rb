class ApplicationController < ActionController::Base
  include ApplicationHelper
  include PreferenceHelper

  add_flash_types :success, :warning, :danger, :info
end
