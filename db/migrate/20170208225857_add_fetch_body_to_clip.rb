class AddFetchBodyToClip < ActiveRecord::Migration[5.0]
  def change
    add_column :clips, :fetch_body, :text
  end
end
