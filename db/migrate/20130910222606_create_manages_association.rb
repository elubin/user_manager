class CreateManagesAssociation < ActiveRecord::Migration
  def change
    create_table :manages do |t|

      t.integer :user_id
      t.integer :direct_report_id

      t.timestamps
    end
  end
end
