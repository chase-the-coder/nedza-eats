class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all
    @user = User.find(params[:user_id])
  end

  def show
  end

  def new
    @order = Order.new
    @user = User.find(params[:user_id])
  end

  def create
    @order = Order.new(order_params)
    @user = User.find(params[:user_id])
    @order.user = current_user
    @order.save

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
    params.require(:order).permit(:address)
  end

  def set_order
    @order = Order.find(params[:id])

  end
end
