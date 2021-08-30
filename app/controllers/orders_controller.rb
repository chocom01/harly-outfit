# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: :show
  load_and_authorize_resource

  def index
    @orders = Order.page(params[:page]).includes(:variants).where(status: 'paid')
  end

  def show
    @order
  end

  def delete_product
    cart.order_items.find_by(variant_id: params[:variant_id]).destroy
    cart.update_sum_price

    redirect_to show_cart_orders_path
  end

  def show_cart
    cart
  end

  def pay
    cart.order_items.each do |item|
      if item.variant.availability < item.quantity
        flash[:error] = 'Ooops.. somethink went wrong, please check availability of products in cart'
        return redirect_back(fallback_location: root_path)
      end

      product_availability = item.variant.availability - item.quantity
      item.variant.update(availability: product_availability)
    end
    cart.update(status: :paid)
    find_or_create_cart
    redirect_to products_path
  end

  def add_product
    add_product_to_order
    if flash[:error]
      return redirect_back(fallback_location: root_path)
    end

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
    if params[:variant_id].nil?
      flash[:error] = 'Please select some variant'
    else
      if Variant.find_by(id: params[:variant_id]).availability >= params[:count].to_i
        cart.order_items.find_or_create_by(variant_id: params[:variant_id])
            .update(quantity: params[:count])
        cart.update_sum_price
      else
        flash[:error] = 'Ooops.. somethink went wrong, please check availability of products in cart'
      end
    end
  end

  def find_or_create_cart
    current_user.orders.find_or_create_by(status: :cart)
  end
end
