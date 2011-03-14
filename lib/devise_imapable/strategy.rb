require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    # Strategy for signing in a user based on his email and password using imap.
    class ImapAuthenticatable < Authenticatable
      def authenticate!
        resource = mapping.to.find_for_imap_authentication(authentication_hash)

        if validate(resource){ resource.valid_imap_password?(password) }
          resource.after_imap_authentication
          success!(resource)
        else
          fail(:invalid)
        end
      end
    end
  end
end

Warden::Strategies.add(:imap_authenticatable, Devise::Strategies::ImapAuthenticatable)