module UsersHelper
  def check item
    item.users.include? current_user
  end
end
