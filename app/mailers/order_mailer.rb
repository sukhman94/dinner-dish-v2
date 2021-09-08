# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]

    mail(to: @order.user.email, subject: 'Order has been placed successfully')
  end
end
