module ApplicationHelper

  def session_info
    text = "Session Info: "
    if current_user
      # text = "Logged in as #{current_user.email}.    "
      text += link_to "Sign Out", destroy_user_session_path, method: "delete"
    else
      text += link_to "Sign In", new_user_session_path
      text += " or "
      text += link_to "Sign Up", new_user_registration_path 
    end
    text

    # link_to "Sign Out", destroy_user_session_path, method:"delete"
  end
  
end
