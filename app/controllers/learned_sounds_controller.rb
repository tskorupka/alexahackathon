class LearnedSoundsController < ApplicationController
  skip_before_filter :authenticate
  def index
    @user = User.find_by user_hash: params[:user_id]
    @learned_sounds = @user.learned_sounds
  end

  def create
    user = User.find_or_create_by user_hash: params[:user_id]
    sounds = Sound.where id: params[:sound_ids]

    @learned_sounds = []
    sounds.each do |sound|
      @learned_sounds.push(LearnedSound.create user: user, sound: sound)
    end
  end
end
