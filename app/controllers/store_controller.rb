class StoreController < ApplicationController
  before_action :increase_counter
  def index
    @products = Product.order(:title)
  end

  private

  def increase_counter
    if session[:counter].nil?
      @counter = session[:counter] = 0
    else
      @counter = session[:counter] += 1
    end
  end
end
