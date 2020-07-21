module ApplicationHelper
  def bootstrap_form_with(form, &block)
    options = {
      model: form,
      builder: BootstrapFormBuilder,
      local: true,
    }
    form_with(options,&block)
  end
end

