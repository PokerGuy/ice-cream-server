class V1::OrderController < ApplicationController
  before_action :authenticate_v1_user!
  skip_before_action :authenticate_v1_user!, only: [:create]

  def create
    @order = Order.new(order_create_params)
    if @order.save
      render json: {status: "success"}, status: :ok
    else
      render json: {error: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order
      render json: {status: "success"}, status: :ok
    else
      render json: {error: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    @orders = Order.all.where(:status=> 'paid').order(created_at: :asc).limit(10)
  end

  def order_params
    params.require(:order).permit(:status)
  end

  def order_create_params
    params.require(:order).permit(:name, :phone_number, :nonce, order_line_items_attributes: [:flavor_id, :quantity])
  end
end
