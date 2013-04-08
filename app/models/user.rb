class User
  def initialize(email)
    @email = email
  end

  def todos
    Todo.where(owner: @email)
  end
end
