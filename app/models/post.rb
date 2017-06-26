class Post < ActiveRecord::Base
 
    belongs_to :user
    #Comment을 가지고 있다.
    has_many :comments, dependent: :destroy
    mount_uploader :image_url, CruduploaderUploader
    
end
