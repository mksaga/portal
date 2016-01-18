module DocsHelper
  
  def user_files_size(user)
    
    user_files = user.docs
    total_size = 0
    if user_files.any?
      user_files.each do |file|
        total_size += file.asset_file_size
      end
      
      return total_size
    else
      return "0"
    end
  end
  
  def uploaded_when(file)
    from_time = file.created_at
    distance_of_time_in_words(from_time, Time.zone.now)
  end
  
end
