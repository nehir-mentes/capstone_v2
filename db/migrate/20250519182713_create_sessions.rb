class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.string :title
      t.integer :restaurant_id
      t.integer :owner

      t.timestamps
    end
  end
end
