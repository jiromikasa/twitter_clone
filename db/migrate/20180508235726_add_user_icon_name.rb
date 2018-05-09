class AddUserIconName < ActiveRecord::Migration[5.2]
	def change
		add_column :users, :icon_name, :string
  end
end
