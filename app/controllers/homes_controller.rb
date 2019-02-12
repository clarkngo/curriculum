class HomesController < ApplicationController
  def index
    @comments = current_user.comments
  end
end
