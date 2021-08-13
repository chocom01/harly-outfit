# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create_review
    Review.create(
      user: current_user, product_id: params[:product_id], text: params[:text]
    )

    redirect_back(fallback_location: root_path)
  end
end
