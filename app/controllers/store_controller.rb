class StoreController < ApplicationController
  include CurrentCart

  before_action :increase_counter
  before_action :set_cart

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
