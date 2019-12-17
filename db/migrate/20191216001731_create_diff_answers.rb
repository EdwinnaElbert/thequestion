class CreateDiffAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :diff_answers do |t|
      t.belongs_to :correction
      t.text       :text

      t.timestamps
    end
  end
end
