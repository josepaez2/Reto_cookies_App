class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.belongs_to :user, foreign_key: true
      t.string :content
      t.datetime :expiration_date
      t.boolean :seen_state

      t.timestamps index: true
    end
  end
end
