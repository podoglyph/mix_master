class ChangeArtistsColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :artists, :artist_name
    remove_column :artists, :artist_image_path
    add_column :artists, :name, :string
    add_column :artists, :image_path, :string
  end
end
