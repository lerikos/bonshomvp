class CreateUserAlertAssociation < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tag, index: true
      t.datetime :preference_date
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
