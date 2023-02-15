class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    # Parameters: {"path_username" => "anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    # if @the_user == nil
    #   redirect_to("/404")
    # else
    render({ :template => "user_templates/show.html.erb" })
    # end
  end

  def insert
    input_username = params.fetch("query_username")

    a_new_user = User.new
    a_new_user.username = input_username

    a_new_user.save
    # render({ :template => "user_templates/insert.html.erb" })
    redirect_to("/users/" + a_new_user.username)
  end

  def update
    # grab id
    the_id = params.fetch("path_id")

    # force a ruby console to appear under this context
    # byebug

    # pull all users by id starting with the user target
    matching_users = User.where({ :id => the_id })
    # grab the first result which is the target user
    the_user = matching_users.at(0)
    # target the input in the form
    input_user = params.fetch("query_username")
    # change the username from the user input form
    the_user.username = input_user
    # save the change
    the_user.save

    # render({ :template => "user_templates/update.html.erb" })

    next_url = "/users/" + the_user.username.to_s

    redirect_to(next_url)
  end
end
