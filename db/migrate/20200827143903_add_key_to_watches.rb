class AddKeyToWatches < ActiveRecord::Migration[6.0]
  def change
    add_reference :watches, :medium, index: true
    add_reference :watches, :user, index: true
  end
end
