# frozen_string_literal: true

module DaisyUi
  class PasswordFieldComponent < TextFieldComponent
    DEFAULT_CLASSES = ['input'].freeze

    erb_template <<~ERB
      <%= password_field_tag(*args) %>
    ERB
  end
end
