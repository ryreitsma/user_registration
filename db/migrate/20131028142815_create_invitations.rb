class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :inviter_name
      t.string :recipient_name
      t.string :recipient_email

      t.timestamps
    end
  end
end
