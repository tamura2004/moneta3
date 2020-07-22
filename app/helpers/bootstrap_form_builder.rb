class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
    name = object.class.human_attribute_name(attribute)

    @template.content_tag(:div, class: "form-group") do
      label(name) +
      super(attribute, class: is_invalid?(attribute)) +
      invalid_feedback(attribute)
    end
  end

  def text_area(attribute, options={})
    name = object.class.human_attribute_name(attribute)
    @template.content_tag(:div, class: "form-group") do
      label(name) +
      super(attribute, class: is_invalid?(attribute), rows: 10) +
      invalid_feedback(attribute)
    end
  end

  def date_field(attribute, options={})
    name = object.class.human_attribute_name(attribute)

    @template.content_tag(:div, class: "form-group") do
      label(name) +
      super(attribute, class: is_invalid?(attribute)) +
      invalid_feedback(attribute)
    end
  end

  def bs_select(attribute, collection, options={})
    name = object.class.human_attribute_name(attribute)

    @template.content_tag(:div, class: "form-group") do
      label(name) +
      select(attribute, collection, {}, class: is_invalid?(attribute)) +
      invalid_feedback(attribute)
    end
  end

  private

  def is_invalid?(attribute)
    object.errors.include?(attribute) ? "form-control is-invalid" : "form-control"
  end

  def invalid_feedback(attribute)
    @template.content_tag(:div, object.errors.full_messages_for(attribute).first, class: "invalid-feedback")
  end
end
