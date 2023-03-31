module ApplicationHelper
  def page_title(title)
    content_for :page_title do
      render partial:'layouts/page_title', locals: {title: title}
    end
  end

  def page_action_footer(buttons = {})
    content_for :page_title do
      render partial:'layouts/page_title', locals: {title: title}
    end
  end

end
