class AddCardToSound < ActiveRecord::Migration
  def up
    add_attachment :sounds, :card
  end

  def down
    remove_attachment :sounds, :card
  end
end
