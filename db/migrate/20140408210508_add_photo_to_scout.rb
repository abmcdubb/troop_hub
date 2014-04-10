class AddPhotoToScout < ActiveRecord::Migration
  def change
    add_column :scouts, :profile_photo, :string
  end
end
