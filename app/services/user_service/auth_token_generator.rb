# UserService::AuthTokenGenerator.new(user, account_id: nil, features: [], expire_duration: 86400).exec
module UserService
  class AuthTokenGenerator
    attr_reader :user, :expire_duration, :options

    def initialize(user, options = {})
      @user             = user
      @expire_duration  = options[:expire_duration] || ENV['JWT_TTL'] || 86400
      @options          = options
    end

    def exec
      now = Time.zone.now
      expires_at = now + expire_duration.to_i

      user.update(auth_token_issued_at: now, auth_token_expires_at: expires_at)
      UserService::AuthToken.issue(user, options)
    end
  end
end
