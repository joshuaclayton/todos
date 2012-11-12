class User
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def signed_in?
    true
  end
end
