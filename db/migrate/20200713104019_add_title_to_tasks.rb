class AddTitleToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :date, :datetime
    add_column :tasks, :judgmente, :string
    add_column :tasks, :meter, :integer
    add_column :tasks, :explanation, :text
  end
end
