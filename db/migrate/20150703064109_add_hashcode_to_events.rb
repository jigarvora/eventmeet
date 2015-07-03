class AddHashcodeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :hashcode, :string
  end
end
