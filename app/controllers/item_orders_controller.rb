class ItemOrdersController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @item_orders = ItemOrder.all
  end

  def show
    @item_order = ItemOrder.find(params[:id])
  end

  def new
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(item_params)
    if @item_order.save
      redirect_to item_path(@item_order)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item_order.update(item_params)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @item_order.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end

  def set_item
    @item_order = ItemOrder.find(params[:id])
  end
end

