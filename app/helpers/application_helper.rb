module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Ahmed Nadar"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
  # how to use it
  # check [layouts/application.html.erb]

  def active_class(link_path)
    active = current_page?(link_path) ? "active" : "no-active"
  end
  #  active if params[:category] == category.name
  # how to use it
  # check [layouts/partials/_header.html.erb]
end
