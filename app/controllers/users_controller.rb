class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def show
    # ユーザープロフィールを表示
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end