# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_product, only: :show
  load_and_authorize_resource

  def index
    @products = Product.page(params[:page])
  end

  def show
    @product
  end

  private

  attr_reader :product

  def find_product
    @product = Product.find_by(id: params[:id])
  end
end
