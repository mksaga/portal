class Doc < ActiveRecord::Base
  
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  
  
  has_attached_file :asset, styles: { medium: "300x300>" },
                            :storage => :s3,
                            :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  do_not_validate_attachment_file_type :asset
  validates_attachment :asset, presence: true
                               # content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  
  def s3_credentials
    {:bucket => "istportal-test", :access_key_id => ENV['AWS_ROOT_ACCESS_KEY_ID'], 
    :secret_access_key => ENV['AWS_ROOT_SECRET_ACCESS_KEY'] }
  end
  
end
