class RenameWikisIdToWikiId < ActiveRecord::Migration[5.1]
  def change
    rename_column :collaborators, :wikis_id, :wiki_id
  end
end
