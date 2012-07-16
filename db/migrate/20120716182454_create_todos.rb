class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :description
      t.string :owner_email

      t.timestamps
    end
  end
end
