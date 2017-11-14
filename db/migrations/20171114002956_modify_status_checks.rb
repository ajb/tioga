Hanami::Model.migration do
  change do
    drop_column :status_checks, :is_open
    add_column :status_checks, :status, String, null: false
  end
end
