class StatusCheck < Hanami::Entity
  def recent?
    created_at > 4.hours.ago
  end
end
