module SsoClient
  class User
    ATTRIBUTES = [:id, :name, :nickname, :email, :first_name, :last_name]
    attr_accessor *ATTRIBUTES

    def initialize(attributes = {})
      self.attributes = attributes
    end

    def self.from_omniauth(omniauth)
      User.new(omniauth['info']).tap do | user |
        user.attributes = omniauth['extra']
        user.id = omniauth['uid']
      end
    end

    def attributes
      ATTRIBUTES.inject(HashWithIndifferentAccess.new) do |result, key|
        result[key] = read_attribute_for_validation(key)
        result
      end
    end

    def attributes=(attrs)
      attrs.each_pair {|k, v| send("#{k}=", v) if ATTRIBUTES.include? k.to_sym}
    end

    def read_attribute_for_validation(key)
      send(key)
    end

    def self.current
      Thread.current[:user]
    end

    def self.current_id
      current.id if current
    end

    def self.current=(user)
      Thread.current[:user] = user
    end

    def new_record?
      false
    end

    def destroyed?
      false
    end

    def self.primary_key
      'id'
    end

    def [](key)
      self.send(key)
    end

  end
end
