class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
