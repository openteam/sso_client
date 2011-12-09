module SsoClient
  class User < ModestModel::Base
    attributes :id, :name, :nickname, :email, :first_name, :last_name, :raw_info

    class << self
      def from_omniauth(omniauth)
        User.new(omniauth['info']).tap do | user |
          user.attributes = omniauth['extra']
          user.id = omniauth['uid']
        end
      end

      def current
        Thread.current[:user]
      end

      def current_id
        current.id if current
      end

      def current=(user)
        Thread.current[:user] = user
      end
    end
  end
end
