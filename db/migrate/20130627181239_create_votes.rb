class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, default: 0
      t.integer :user_id
      t.integer :votable_id
      t.string  :votable_type
    end
  end
end
