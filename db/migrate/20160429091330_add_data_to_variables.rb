class AddDataToVariables < ActiveRecord::Migration
  def change
    Variable.create(name: "album_download")
  end
end
