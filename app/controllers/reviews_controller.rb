# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    review = Review.new(
      user: current_user, product_id: params[:product_id], text: params[:text]
    )

    review.save || flash[:error] = review.errors.full_messages.to_sentence
    redirect_back(fallback_location: root_path)
  end
end
