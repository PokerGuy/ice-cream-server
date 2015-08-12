class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :json
end
