module BadgesHelper
  def badge_image(badge)
    if badge.image_url.present?
      badge.image_url
    else
      asset_path 'ruby.png'
    end
  end
end
