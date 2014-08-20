class ChangeUserEmailToBeNullable < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up { t.change :email, :string, default: "", null: true }
        dir.down { t.change :email, :string, default: "", null: false }
      end
    end
  end
end
