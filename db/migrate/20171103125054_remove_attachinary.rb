class RemoveAttachinary < ActiveRecord::Migration[5.0]
def up
  drop_table :attachinary_files
end
end
