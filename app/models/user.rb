class User
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def todos
    Todo.where(owner_email: @email)
  end
end
