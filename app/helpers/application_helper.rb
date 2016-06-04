module ApplicationHelper

  #this helper is to provide a default page title
  def full_title(page_title='')
    base_title="Sample App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
