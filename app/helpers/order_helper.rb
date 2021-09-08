# frozen_string_literal: true

module OrderHelper
  def total_bill
    Cart.where(session_id: current_user.id).sum('quantity*price')
  end
end
