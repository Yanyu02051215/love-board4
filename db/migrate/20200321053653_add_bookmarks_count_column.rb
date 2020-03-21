class AddBookmarksCountColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :bookmarks_count, :integer ,default: 0, null: false
  end
end
