class AddUnderReviewToEvents < ActiveRecord::Migration
  def change
    add_column :events, :under_review, :boolean
  end
end
