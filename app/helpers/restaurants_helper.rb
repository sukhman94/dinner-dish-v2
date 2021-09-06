# frozen_string_literal: true

module RestaurantsHelper # rubocop:disable Style/Documentation
  def restaurant_avatar(restaurant)
    size = '50x50!'
    if restaurant.avatar.attached?
      image_tag restaurant.avatar.variant(resize: size).processed, class: 'rounded-circle'
    else
      image_tag 'default_hotel.png', class: 'rounded-circle'
    end
  end
end
