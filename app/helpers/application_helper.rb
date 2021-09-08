# frozen_string_literal: true

module ApplicationHelper # rubocop:disable Style/Documentation
  def browser_session
    request.session[:session_id]
  end

  def session_id
    if user_signed_in?
      current_user.id
    else
      browser_session.to_s
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

  def restaurant_ids
    @items = Cart.joins(:item).where(session_id: session_id).first&.item
    @items&.restaurant_id
  end
end
