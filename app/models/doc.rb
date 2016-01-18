class Doc < ActiveRecord::Base
  
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  
  
  has_attached_file :asset, styles: { medium: "300x300>", thumb: "100x100>", large: "500x500>" }
  
  
  
  
  
  
  validates_attachment :asset, presence: true,
                               content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  
  # likely final implementation
  # do_not_validate_attachment_type :asset
end
