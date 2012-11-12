class AddOwnerEmailToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :owner_email, :string
  end
end
