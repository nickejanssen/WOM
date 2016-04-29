class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :name, default: ""
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
