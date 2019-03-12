module BadgesHelper
  def badge_image(badge)
    if badge.image_url.present?
      badge.image_url
    else
      asset_path 'ruby.png'
    end
  end

  def badge_color(category)
    case category
      when 'category'
        "label label-success"
      when 'attempt'
        "label label-info"
      when 'level'
        "label label-warning"
    end
  end
end
