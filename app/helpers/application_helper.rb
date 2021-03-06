module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "HeadFlow Sosohan Moim"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
      image_tag("logo.png", :alt => "Sosohan Moim", :class => "round")
    end

  def newmoim_logo
      image_tag("new_moim.png", :alt => "Sosohan Moim", :class => "round")
  end
end
