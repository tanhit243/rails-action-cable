# frozen_string_literal: true

# Parameter sanitizer for User model
module ParameterSanitizers
  module User
    # UserParameterSanitizer
    class ParameterSanitizer < Devise::ParameterSanitizer
      def initialize(*)
        super
        permit :sign_up, keys: %i[name]
      end
    end
  end
end
