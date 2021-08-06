# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @orders = Order.page(params[:page]).includes(:products)
  end

  def show_cart
    cart
  end

  def pay
    cart.update(status: :paid) unless cart.order_items.empty?

    redirect_to products_path
  end

  def add_product
    add_product_to_order && cart.touch

    redirect_to show_cart_orders_path
  end

  private

  def cart
    @cart ||= current_user.orders.find_or_create_by(status: :cart)
  end

  def add_product_to_order
    if cart.products.ids.include?(params[:product_id].to_i)
      cart.order_items.find_by(product_id: params[:product_id].to_i).touch
    else
      cart.order_items.create(product_id: params[:product_id].to_i)
    end
  end
end
