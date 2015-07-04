class RemoveEventCodeFromEvents < ActiveRecord::Migration
  def up
  	change_table :events do |t|
		t.remove :event_code
	end
  end
  def down
  	change_table :events do |t|
		t.string :event_code
	end
  end
end
