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
      "http://www.ahmednadar.com/"
    else
      # Our dev & test URL.
      "http://localhost:3000"
    end
  end

  class HTMLwithPygments < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants
    def block_code(code, language)
      Pygments.highlight(code, lexer: language, options: {lineanchors: "line"})
    end
  end

  # markdown format
  def markdown(text)
    Haml::Template.options[:ugly] = true
    renderer = HTMLwithPygments.new(prettify: true, hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      ugly: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      highlight: true,
      quote: true,
      footnotes: true,
      tables: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end
