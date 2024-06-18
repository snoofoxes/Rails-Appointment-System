module ApplicationHelper

  def show_errors_for(object)
    return unless object.errors.any?

    content_tag(:div, class: "error_messages") do
      concat(content_tag(:h2, "#{pluralize(object.errors.count, 'error')} prohibited this #{object.class.name.downcase} from being saved:"))
      concat(
        content_tag(:ul) do
          object.errors.full_messages.each do |message|
            concat(content_tag(:li, message))
          end
        end
      )
    end
  end

end
