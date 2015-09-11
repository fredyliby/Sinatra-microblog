class CreatePostsTable < ActiveRecord::Migration

  def up :posts do |t|
  	t.string:title
  	t.string:content
  	t.integer:user_id


  end
end
