class CreateSpreeStockEmails < ActiveRecord::Migration
  def change
    create_table :spree_stock_emails do |t|
      t.timestamps
      t.references :product, null: false
      t.string :email, null: false
      t.datetime :sent_at, default: nil
    end
  end
end
