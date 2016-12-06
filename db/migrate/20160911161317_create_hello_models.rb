class CreateHelloModels < ActiveRecord::Migration
  def change
    create_table :hello_models do |t|
      t.string :hellotext
      t.string :uptime

      t.timestamps null: false
    end
  end
end
