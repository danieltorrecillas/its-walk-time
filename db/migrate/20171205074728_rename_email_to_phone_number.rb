class RenameEmailToPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    rename_column :subscribers, :email, :phone_number
  end
end
