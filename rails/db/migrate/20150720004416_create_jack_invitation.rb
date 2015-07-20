class CreateJackInvitation < ActiveRecord::Migration
  def change
    create_table :jack_invitations do |t|
      t.references :user, index: true
      t.references :jack, index: true
    end
  end
end
