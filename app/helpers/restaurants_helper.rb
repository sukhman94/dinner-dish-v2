# frozen_string_literal: true

module RestaurantsHelper
  def restaurant_avatar(restaurant)
    size = '50x50!'
    if restaurant.avatar.attached?
      image_tag restaurant.avatar.processed, class: 'rounded-circle'
    else
      image_tag 'default_hotel.png', class: 'rounded-circle'
    end
  end

  def restaurant_all_image(restaurant)
    if restaurant.avatar.attached?
      image_tag restaurant.avatar, width: '100%', height: '200px'
    else
      image_tag 'default_hotel.png', width: '100%', height: '200px'
    end
  end
end
