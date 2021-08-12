# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @orders = Order.page(params[:page]).includes(:products).where(status: 'paid')
  end

  def delete_product
    cart.order_items.find_by(product_id: params[:product_id]).destroy

    redirect_to show_cart_orders_path
  end

  def show_cart
    cart
  end

  def pay
    cart.update(status: :paid) unless cart.order_items.empty?
    create_empty_cart

    redirect_to products_path
  end

  def add_product
    add_product_to_order.update(quantity: params[:count]) && cart.set_sum_price

    redirect_to show_cart_orders_path
  end

  private

  def cart
    @cart ||= create_empty_cart
  end

  def add_product_to_order
    cart.order_items.find_or_create_by(product_id: params[:product_id].to_i)
  end

  def create_empty_cart
    current_user.orders.find_or_create_by(status: :cart)
  end
end
