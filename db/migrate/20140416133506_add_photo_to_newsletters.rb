class AddPhotoToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :news_photo, :string
  end
end