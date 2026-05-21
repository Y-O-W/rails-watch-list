class AddForeignKeyToBookmarksMovie < ActiveRecord::Migration[8.1]
  def change
    # Remove the existing foreign key if it exists without constraint
    remove_foreign_key :bookmarks, :movies if foreign_key_exists?(:bookmarks, :movies)

    # Add it back with strict constraint
    add_foreign_key :bookmarks, :movies
  end
end
