class CreateLearnedSounds < ActiveRecord::Migration
  def change
    create_table :learned_sounds do |t|
      t.references :user
      t.references :sound

      t.timestamps null: false
    end
  end
end
