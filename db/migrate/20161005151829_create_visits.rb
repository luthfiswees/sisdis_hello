class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :counter

      t.timestamps null: false
    end
  end
end
