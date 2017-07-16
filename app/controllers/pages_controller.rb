class PagesController < ApplicationController
  before_action :check_login, only: [:home]

  private
    def check_login
      redirect_to '/alerts-listing' if current_user
    end
end
