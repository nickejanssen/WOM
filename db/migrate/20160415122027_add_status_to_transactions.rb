class AddStatusToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :status, :boolean, default: false
  end
end
