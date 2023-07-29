module ApplicationHelper
  def bootstrap_form_with(form, **options, &block)
    # options[:model] = form
    # options[:builder] = BootstrapFormBuilder
    # options[:local] = true
    options.merge!({
      model: form,
      builder: BootstrapFormBuilder,
      local: true,
    })
    form_with(options,&block)
  end
end

