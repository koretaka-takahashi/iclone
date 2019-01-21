class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.text "image"
      t.string "text"
      t.bigint "user_id"
      t.timestamps
    end
  end
end
