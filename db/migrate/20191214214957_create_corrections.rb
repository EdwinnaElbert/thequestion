class CreateCorrections < ActiveRecord::Migration[6.0]
  def change
    create_table :corrections do |t|
      t.belongs_to :answer
      t.belongs_to :user

      t.text       :text
      t.datetime   :accepted_at
      t.timestamps
    end
  end
end
