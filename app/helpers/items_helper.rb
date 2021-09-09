# frozen_string_literal: true

module ItemsHelper
  def item_avatar(item, size)
    if item.item_image[0]
      image_tag item.item_image[0].variant(resize: size).processed
    end
  end
end
