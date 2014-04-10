class AddOnPageToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :on_page, :string
  end
end
