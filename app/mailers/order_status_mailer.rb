# frozen_string_literal: true

class OrderStatusMailer < ApplicationMailer
  def order_status_email
    @order = params[:order]

    mail(to: @order.user.email, subject: 'Order has been Cancelled')
  end
end
