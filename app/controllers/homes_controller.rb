class HomesController < ApplicationController
  def index
    if current_user
      @comments = current_user.comments
    end
  end
end
