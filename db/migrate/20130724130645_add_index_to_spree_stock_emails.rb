class AddIndexToSpreeStockEmails < ActiveRecord::Migration
  def change
    add_index :spree_stock_emails, [:sent_at, :product_id, :email]
  end
end
