class AddOwnerToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :owner, :string
    add_index :todos, :owner
  end
end
