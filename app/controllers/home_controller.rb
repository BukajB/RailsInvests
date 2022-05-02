class HomeController < ApplicationController
  def index
  end

  def about
    @about_me = "This page is a tool for tracking of your investments"
  end

end
