module UsersHelper
  def simple_user_info(user)
    if user.first_name && user.last_name
      name = [user.first_name, user.last_name].join(" ")
      "Signed in as #{name} (#{user.email})"
    else
      "Signed in as #{user.email}"
    end
  end
end