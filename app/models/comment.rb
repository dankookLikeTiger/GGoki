class Comment < ActiveRecord::Base
#Post에 속해 있다.
    belongs_to :post
end
