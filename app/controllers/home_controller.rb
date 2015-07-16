class HomeController < ApplicationController

  def index
    @clients = Client.all

    render layout: "home"
  end

end
