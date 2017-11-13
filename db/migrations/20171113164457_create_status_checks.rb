Hanami::Model.migration do
  change do
    create_table :status_checks do
      primary_key :id

      column :is_open, :boolean, null: false
      column :response_html, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
