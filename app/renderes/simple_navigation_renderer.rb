
class SimpleNavigationRenderer < SimpleNavigation::Renderer::Base
  def render(item_container)
    item_container.selected_class = ""

    content = item_container.items.inject([]) do |list, item|
      list << item_tag(item)
    end
    return '' if skip_if_empty? && item_container.empty?

    list_class = add_class(item_container.dom_class, 'nav nav-tabs')
    content_tag(:ul, content_list_to_html(content), id: item_container.dom_id, class: list_class)
  end

  def item_tag(item)
    li_content = tag_for(item)
    li_options = item.html_options.reject { |k, _| k == :link }
    li_options[:class] = add_class(li_options[:class], 'nav-item')
    content_tag(:li, li_content, li_options)
  end

  def tag_for(item)
    link_html_options = link_options_for(item)
    link_html_options[:class] = add_class(link_html_options[:class], 'nav-link')
    if item.selected?
      link_html_options[:class] = add_class(link_html_options[:class], 'active')
    end
    link_url = suppress_link?(item) ? 'javascript:void(0)' : item.url
    link_to content_list_to_html(item.name), link_url, link_html_options
  end

  def add_class(class_list, new_class)
    class_list ||= ''
    class_list.split(' ').push(new_class).join(' ')
  end

  def content_list_to_html(list_content=[])
    list_content = [list_content] unless list_content.is_a?(Array)
    list_content.join.html_safe
  end

end