module Helpers
  module Integration
    module SignIn
      def sign_in_as(email)
        visit root_path
        fill_in 'Email', with: email
        click_button 'Sign in'
      end
    end
  end
end

RSpec.configure do |config|
  config.include Helpers::Integration::SignIn, type: :request
end
