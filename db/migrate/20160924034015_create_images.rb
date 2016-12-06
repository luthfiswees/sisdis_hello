class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.integer :filesize
      t.string :fileimage

      t.timestamps null: false
    end
  end
end
