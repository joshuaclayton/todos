class AddCompletedAtToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :completed_at, :datetime
    add_index :todos, :completed_at
  end
end
