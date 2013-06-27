class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references  :question
      t.references  :user
      t.string      :url
      t.text        :content

      t.timestamps
    end

    add_index :answers, [:url, :question_id], unique: true
  end
end
