class CreateUsersTable < ActiveRecord::Migration

  def up :users do |t|
  	t.string:first_name
  	t.string:last_name
  	t.string:email

  end
end

 def down
 	drop_table:users
 end
 	
 end
