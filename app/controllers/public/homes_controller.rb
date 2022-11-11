class Public::HomesController < ApplicationController
  def top
    @users = User.limit(3).order(created_at: :desc)
  end

  def about
  end
end
