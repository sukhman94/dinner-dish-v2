# frozen_string_literal: true

module ItemsHelper
  def item_avatar(item)
    size = '100%x100%!'
    if item.item_image[0]
      image_tag item.item_image[0].variant(resize: size).processed
    else
      image_tag 'default_item.png', class: 'w-100'
    end
  end
end
