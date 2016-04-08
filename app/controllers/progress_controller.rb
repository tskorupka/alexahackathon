class ProgressController < ApplicationController
  skip_before_filter :authenticate
  def index
    user = User.find_or_create_by user_hash: params[:user_id]
    @learnt = LearnedSound.where(user: user).group(:sound_id).count.map{|k,v| k if v >= 2}.compact.count
    @all = Sound.all.count
    @incompleted = @all - @learnt
    @inprogress = LearnedSound.where(user: user).group(:sound_id).count.map{|k,v| k if v < 2 and v > 0}.compact.count
  end
end
