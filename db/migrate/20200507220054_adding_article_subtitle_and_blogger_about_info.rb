class AddingArticleSubtitleAndBloggerAboutInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :info, :text
    add_column :articles, :subtitle, :string
  end
end
