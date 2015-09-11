class User < ActiveRecord::Base
 has_many:posts

end

class posts < ActiveRecord::Base
	belongs_to:User
end

class profile <ActiveRecord::Base
	belongs_to:User