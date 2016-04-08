class SoundsController < ApplicationController
  skip_before_filter :authenticate
  def show
    user = User.find_or_create_by user_hash: params[:user_id]
    already_learnt_ids = LearnedSound.where(user: user).group(:sound_id).count.map{|k,v| k if v >= 2}.compact
    @sounds = Sound.where.not(id: already_learnt_ids).reject{|s| !s.file.exists?}.take(params[:id].to_i)
  end
end
