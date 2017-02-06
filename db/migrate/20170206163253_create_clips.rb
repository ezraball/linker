class CreateClips < ActiveRecord::Migration[5.0]
  def change
    create_table :clips do |t|
      t.string :title
      t.text :description
      t.text :quote
      t.text :commentary
      t.string :link
      t.datetime :link_date
      t.datetime :pub_date
      t.string :source_name
      t.string :source_url
      t.string :fetch_response
      t.datetime :fetch_date

      t.timestamps
    end
  end
end
