class V1::FlavorsController < ApplicationController
  before_action :authenticate_v1_user!
  skip_before_action :authenticate_v1_user!, only: [:index, :show, :all]

  def create
    @flavor = Flavor.new(flavor_create_params)
    if @flavor.save
      render json: {status: "success"}, status: :ok
    else
      render json: {error: @flavor.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    @flavors = Flavor.where(["stock_quantity > 0"]).order(:name)
  end

  def admin_index
    @flavors = Flavor.all.order(:name)
  end

  def all
    @flavors = Flavor.all.order(stock_quantity: :desc, name: :asc)
  end

  def show
    @flavor = Flavor.find(params[:id])
    @flavor
  end

  def update
    @flavor = Flavor.find(params[:id])
    if @flavor.update(flavor_update_params)
      render json: {status: "success"}, status: :ok
    else
      render json: {error: @flavor.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def flavor_create_params
    params.require(:flavor).permit(:name, :stock_quantity, :description, :ingredients, prices_attributes: [:price])
  end

  def flavor_update_params
    params.require(:flavor).permit(:name, :stock_quantity, :description, :ingredients)
  end
end
