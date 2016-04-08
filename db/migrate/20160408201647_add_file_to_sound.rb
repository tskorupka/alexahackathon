class AddFileToSound < ActiveRecord::Migration
  def up
    add_attachment :sounds, :file
  end

  def down
    remove_attachment :sounds, :file
  end
end
