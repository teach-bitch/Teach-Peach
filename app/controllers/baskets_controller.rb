class BasketsController < ApplicationController
  include BasketsHelper
  before_action :set_price

  def show
    unless @current_basket.id == Basket.find(params[:id]).id
      redirect_to root_path
    end
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
