class AddPasswordNotNullToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :password, false
  end
end
