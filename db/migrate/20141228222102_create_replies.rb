class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :text
      t.integer :topic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
