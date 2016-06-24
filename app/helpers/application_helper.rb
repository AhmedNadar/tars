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

def site_footer
  "Ahmed Nadar. Made with love in Toronto"
end

def meta_author
  "Ahmed Nadar"
end

def meta_description
  "Ahmed Nadar, offers consultent for web development and design"
end

def meta_keywords
  "Web Development"
end


def site_url
  if Rails.env.production?
    # Place production URL
    "http://www.ahmedandar.com/"
  else
    # Our dev & test URL.
    "http://localhost:3000"
  end
end


end
