class Photo < ApplicationRecord
  belongs_to :user
  
  has_attached_file :image, styles: { :medium => "300x300>", :thumb => "45x45>" }, 
                    default_url: "https://cdn3.iconfinder.com/data/icons/rcons-file-action/512/file_notice-512.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment :image, presence: true
end
