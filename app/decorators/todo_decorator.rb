class TodoDecorator < Draper::Base
  decorates :todo

  def list_item(&block)
    h.content_tag(:li, list_item_options, &block)
  end

  def completion_link
    if completed_at?
      h.link_to 'Incomplete', completion_path, method: :delete
    else
      h.link_to 'Complete', completion_path, method: :post
    end
  end

  private

  def completion_path
    h.todo_completion_path(self)
  end

  def dom_id
    h.dom_id(self)
  end

  def list_item_options
    options = { id: dom_id }

    if state.present?
      options[:class] = state
    end

    options
  end

  def state
    if completed_at
      'complete'
    end
  end
end
