class Users::SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    if ((@_lookup_context.instance_values["details"][:formats]).length>1)
      respond_with(resource, serialize_options(resource))
    else
       respond_with(resource, serialize_options(resource)) do |format|
        format.html { render action: "new_full_page"}
      end
     # respond_with(resource, serialize_options(resource))
    end
  end
end