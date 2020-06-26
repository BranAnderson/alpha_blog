class ChangePublicDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :public, :boolean, default: false
  end
end
