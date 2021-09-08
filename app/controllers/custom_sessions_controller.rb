# frozen_string_literal: true

class CustomSessionsController < Devise::SessionsController
  after_action :after_login, only: :create # rubocop:disable Rails/LexicallyScopedActionFilter

  def after_login
    @test = Cart.where(session_id: browser_session.to_s).update(session_id: current_user.id)
  end
end
