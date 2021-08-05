# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: :show
  load_and_authorize_resource

  def index
    @orders = Order.page(params[:page])
  end

  def show_cart
    current_user.available_cart
  end

  def add_product
    check_exists_cart && current_user.orders.last.touch
    redirect_to orders_path
  end

  private

  attr_reader :order

  def find_order
    @order = Order.find_by(id: params[:id])
  end

  def check_exists_cart
    current_user.orders.create if current_user.orders.available_cart.empty?
    current_user.orders.last.order_items.create(product_id: params[:product_id])
  end
end
