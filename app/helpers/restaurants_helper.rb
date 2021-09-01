# frozen_string_literal: true

module RestaurantsHelper # rubocop:disable Style/Documentation
  def restaurant_avatar(restaurant)
    if restaurant.avatar.attached?
      image_tag restaurant.avatar.variant(resize: '50x50!').processed
    else
      image_tag 'default_hotel.png'
    end
  end
end
