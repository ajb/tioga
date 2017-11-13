class StatusCheckRepository < Hanami::Repository
  def most_recent_status_check
    status_checks.
      order { created_at.desc }.
      limit(1).
      one
  end
end
