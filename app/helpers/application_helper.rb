module ApplicationHelper

  def full_title(page_title)
    base_title = "Reactif"
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end
end
