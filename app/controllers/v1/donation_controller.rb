class V1::DonationController < ApplicationController

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      render json: {status: "success"}, status: :ok
    else
      render json: {error: @donation.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    @donations = Donation.all.order(created_at: :desc)
  end

  def donation_params
    params.require(:donation).permit(:name, :amount, :allow_display, :nonce)
  end

end