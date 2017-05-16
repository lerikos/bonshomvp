class CreateUserAlertAssociation < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tag, index: true
      t.datetime :skill_date
      t.timestamps
    end

    create_table :concerns do |t|
      t.belongs_to :alert, index: true
      t.belongs_to :tag, index: true
      t.datetime :concern_date
      t.timestamps
    end
  end
end
