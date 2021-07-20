# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_product, only: :show

  def index
    render json: Product.all
  end

  def show
    render json: product
  end

  private

  attr_reader :product

  def find_product
    @product = Product.find_by(id: params[:id])
    # return status: 404 if @product.nil?
  end
end
