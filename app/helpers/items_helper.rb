# frozen_string_literal: true

module ItemsHelper
  def item_avatar(item)
    if item.item_image[0]
      image_tag item.item_image[0]
    else
      image_tag 'default_item.png', class: 'w-100'
    end
  end
end
