class AddFirstnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :token, :string
    add_column :users, :zipcode, :string
  end
end
