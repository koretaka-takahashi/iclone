module FeedsHelper
  def choose_index_or_edit
    if action_name == 'index' || action_name == 'confirm'
      confirm_feeds_path
    elsif action_name == 'edit'
      feed_path
    end  
  end      
end
