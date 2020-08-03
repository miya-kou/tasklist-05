class AddTitle3ToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :playback, :string
  end
end
