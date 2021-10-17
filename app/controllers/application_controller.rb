# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  before_action :authenticate_user!

  protected

  def devise_parameter_sanitizer
    ParameterSanitizers::User::ParameterSanitizer.new User, :user, params
  end
end
