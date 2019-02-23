class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :set_member
  before_action :authenticate_member!

  def index
    authorize @profile
    @profiles = Profile.all
  end

  def show
    authorize @profile
  end

  def new
    @profile = @member.build_profile
    authorize @profile
  end
  
  def edit
  end
end
