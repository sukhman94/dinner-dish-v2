# frozen_string_literal: true

module CartsHelper
  def checkout(user)
    if user&.user?
      link_to ' Checkout', new_order_path, class: 'btn btn-success btn-block fa fa-angle-right'
    elsif user&.admin?
      link_to ' Login as User to add order', new_user_registration_path, class: 'btn btn-success btn-block '
    else
      link_to ' Login to continue', new_user_session_path, class: 'btn btn-success btn-block'
    end
  end
end
