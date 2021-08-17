# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    review = current_user.reviews.new(review_params)
    unless review.save
      flash[:error] = review.errors.full_messages.to_sentence
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :text)
  end
end
