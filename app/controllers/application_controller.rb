class ApplicationController < ActionController::Base
  before_action :check_env_variables

  http_basic_authenticate_with name: ENV["BASIC_AUTH_NAME"], password: ENV["BASIC_AUTH_PASSWORD"], except: [ :index, :show ]

  private

  def check_env_variables
    raise "ENV['BASIC_AUTH_NAME'] is not set" unless ENV["BASIC_AUTH_NAME"].present?
    raise "ENV['BASIC_AUTH_PASSWORD'] is not set" unless ENV["BASIC_AUTH_PASSWORD"].present?
  end
end
