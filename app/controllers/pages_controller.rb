# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
    render json: @pages
  end

  def show
    render json: @page
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      render json: @page, status: :created, location: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  def update
    if @page.update(page_params)
      render json: @page, status: :ok, location: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @page.destroy
    head :no_content
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:url)
  end
end
