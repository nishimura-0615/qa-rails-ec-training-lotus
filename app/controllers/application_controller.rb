class ApplicationController < ActionController::Base
  include SessionsHelper

  def set_csrf_token_header
    binding.pry
    response.set_header('X-CSRF-Token', form_authenticity_token)
  end
end
