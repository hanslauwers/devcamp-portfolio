module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(styles)
    if session[:source]
      source_greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{link_to 'contact me', contact_path}.".html_safe
      content_tag(:p, source_greeting, class: styles)
    end
  end

  def set_copyright
    LauwersCopyrightTool::Renderer.copyright 'Hans Lauwers', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },{
        url: about_me_path,
        title: "About me"
      },{
        url: contact_path,
        title: "Contact"
      },{
        url: portfolios_path,
        title: "Portfolios"
      },{
        url: blogs_path,
        title: "Blogs"
      },{
        url: tech_news_path,
        title: "Tech News"
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Hans Lauwers Portfolio", sticky: false, time: 1000)
  end
end
