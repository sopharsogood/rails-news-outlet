module UsersHelper

    def display_user_link(user)
        link_to user.name, user
    end

end
