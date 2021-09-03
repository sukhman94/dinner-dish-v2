# frozen_string_literal: true

module ApplicationHelper # rubocop:disable Style/Documentation
  def session_id
    if user_signed_in?
      current_user.id
    else
      request.session[:session_id]
    end
  end

  def current_order(id)
    @avaliablity = Cart.where(session_id: session_id, item_id: id).count
    if @avaliablity.zero?
      true
    else
      false
    end
  end
end
