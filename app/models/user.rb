class User
  def initialize(email)
    @email = email
  end

  def signed_in?
    true
  end

  def display_name
    @email
  end

  def todos
    Todo.where(owner_email: @email)
  end
end
