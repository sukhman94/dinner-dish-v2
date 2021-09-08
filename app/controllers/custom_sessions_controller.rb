# frozen_string_literal: true

class CustomSessionsController < Devise::SessionsController # rubocop:disable Style/Documentation
  after_action :after_login, only: :create

  def after_login
    @test = Cart.where(session_id: browser_session.to_s).update(session_id: current_user.id)
  end
end
