class SitesController < ApplicationController
  before_action :find_site, only: [:update, :show]

  def index
    @sites = Site.all
    render json: @sites
  end

  def create
    @site = Site.create(site_params)
    if @site.save
    render json: @site, status: 201
    else
      render json: { errors: @site.errors.full_message }, status: :unprocessible_entity
    end
  end

  def show
    render json: @site, status: :accepted
  end

  def update
    @site.update(site_params)
    if @site.save
      render json: @site, status: :accepted
    else
      render json: { errors: @site.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def site_params
    params.permit(:name, :price)
  end

  def find_site
    @site = Site.find(params[:id])
  end
end
