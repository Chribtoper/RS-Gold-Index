class PricesController < ApplicationController
  before_action :find_site, only: [:show]

  def index
    @site = Site.find(params[:site_id])
    render json: @site.prices
  end

  def create
    @price = Price.create(price_params)
    if @price.save
      render json: @price, status: 201
    else
      render json: { errors: @price.errors.full_message }, status: :unprocessible_entity
    end
  end

  private

  def price_params
    params.permit(:price, :site_id)
  end
end
