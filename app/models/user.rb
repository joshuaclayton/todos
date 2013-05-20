class User
  def initialize(email)
    @email = email
  end

  def todos
    Todo.where(owner_email: @email)
  end
end
