class StatusCheck < Hanami::Entity
  STATUS_OPTIONS = %w(open closed call error)

  def recent?
    created_at > 4.hours.ago
  end
end
