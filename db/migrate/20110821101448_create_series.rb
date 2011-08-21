class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.integer :user_id
      t.integer :sum

      t.timestamps
    end
  end
end
