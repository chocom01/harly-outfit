# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create_review
    result = Review.new(
      user: current_user, product_id: params[:product_id], text: params[:text]
    )

    result.save || flash[:error] = result.errors.full_messages.to_sentence
    redirect_back(fallback_location: root_path)
  end
end
