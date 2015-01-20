class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username
  		t.string :email_address
  		t.string :phone
  		t.string :password
  	end
  end
end
