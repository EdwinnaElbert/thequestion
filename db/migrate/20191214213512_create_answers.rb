class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question
      t.belongs_to :user

      t.text :text
      t.timestamps
    end
  end
end
