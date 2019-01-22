class SitesController < ApplicationController
  before_action :find_site, only: [:update, :show]

  def index
    @sites = Site.all
    render json: @sites
  end

  def create
    @site = Site.create(site_params)
    render json: @site, status: 201
  end

  def show
    render json: @site, status: :accepted
  end

  def update
    @site.update(strong_params)
    if @site.save
      render json: @site, status: :accepted
    else
      render json: { errors: @site.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :price)
  end

  def find_site
    @site = Site.find(params[:id])
  end
end
