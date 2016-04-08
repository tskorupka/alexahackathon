class Sound < ActiveRecord::Base
  has_attached_file :file,
    {
      :styles => lambda { |a|
        {original: {}}
      },
      :processors => lambda { |a|
        [:alexa_processor]
      },
      path: 'words/pl/:hash.:extension',
      hash_secret: 'ThisHashIsSecretSoBad'
    }
  has_attached_file :card,
    {
      path: 'cards/pl/:hash.:extension',
      hash_secret: 'ThisHashIsSecretSoBad'
    }
  validates_attachment_content_type :card, :content_type => /image/
  validates_attachment_content_type :file, :content_type => /audio/
  has_many :learned_sounds
end
