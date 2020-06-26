class PublicAndPrivateBools < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :public, :boolean, default: true
    add_column :articles, :private, :boolean, default: false
  end
end
