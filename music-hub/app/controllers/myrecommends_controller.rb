class MyrecommendsController < ApplicationController
	before_action :set_recommend

  def create
    @myrecommend = Myrecommend.create(user_id: current_user.id, recommend_id: @recommend.id)
  end

  def destroy
    @myrecommend = Myrecommend.find_by(user_id: current_user.id, recommend_id: @recommend.id)
    @myrecommend.destroy
  end

  private
  def set_recommend
    @recommend = Recommend.find(params[:recommend_id])
  end
end
