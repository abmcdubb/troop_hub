class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :agendas, :correspondence
    remove_column :agendas, :parent_info
    remove_column :agendas, :name
    remove_column :agendas, :description
    remove_column :agendas, :decisions

  end
end
