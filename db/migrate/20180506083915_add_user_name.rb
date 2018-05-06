class AddUserName < ActiveRecord::Migration[5.2]
	def change
		add_column :users, :name, :string
		remove_column :users, :email, :integer
		remove_column :users, :password, :integer
		add_column :users, :email, :string
		add_column :users, :password, :string
  end
end
