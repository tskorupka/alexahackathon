class AddTranslationToSound < ActiveRecord::Migration
  def change
    add_column :sounds, :translation, :string
  end
end
