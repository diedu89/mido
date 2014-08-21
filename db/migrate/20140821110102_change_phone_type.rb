class ChangePhoneType < ActiveRecord::Migration
  def change
  	remove_column :contacts, :phone
  	add_column :contacts, :phone, :integer, :limit => 8
  end
end
