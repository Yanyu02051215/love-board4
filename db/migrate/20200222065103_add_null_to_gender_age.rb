class AddNullToGenderAge < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :gender, false
    change_column_null :users, :age, false
  end
end
