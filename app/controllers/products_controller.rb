# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: :show
  skip_before_action :authenticate_user!, only: [:index]

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
