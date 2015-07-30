module API
  class ApiController < ApplicationController
    # Only respond to json
    respond_to :json
  end
end