# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: :show
  load_and_authorize_resource

  def index
    @orders = Order.page(params[:page]).includes(:products).where(status: 'paid')
  end

  def show
    @order
  end

  def delete_product
    cart.order_items.find_by(product_id: params[:product_id]).destroy
    cart.update_sum_price

    redirect_to show_cart_orders_path
  end

  def show_cart
    cart
  end

  def pay
    cart.order_items.each do |item|
      if item.product.availability < item.quantity
        flash[:alert] = 'Ooops.. somethink went wrong, please check availability of products in cart'
        return redirect_back(fallback_location: root_path)
      end

      product_availability = item.product.availability - item.quantity
      item.product.update(availability: product_availability)
    end
    cart.update(status: :paid) && create_empty_cart
    redirect_to products_path
  end

  def add_product
    add_product_to_order.update(quantity: params[:count]) && cart.set_sum_price

    redirect_to show_cart_orders_path
  end

  private

  def find_order
    @order = Order.find_by(id: params[:id])
  end

  def cart
    @cart ||= find_or_create_cart
  end

  def add_product_to_order
    cart.order_items.find_or_create_by(product_id: params[:product_id].to_i)
  end

  def find_or_create_cart
    current_user.orders.find_or_create_by(status: :cart)
  end
end
