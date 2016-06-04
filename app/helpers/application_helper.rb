module ApplicationHelper

  #this helper is to provide a default page title
  def full_title(page_title='')
    base_title="Sample App"
    if page_title.empty?
      baes_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
