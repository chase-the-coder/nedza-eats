class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @order.destroy
  end

  private

  def order_params
    params.require(:order).permit(:name, :description, :price)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
