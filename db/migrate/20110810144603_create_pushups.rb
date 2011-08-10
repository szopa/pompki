class CreatePushups < ActiveRecord::Migration
  def change
    create_table :pushups do |t|
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
    add_index :pushups, :user_id
  end
end
