class RemoveQuestionFromReaction < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :reactions, :questions 
    remove_reference :reactions, :question, index: true
  end
end
