class StatusCheckRepository < Hanami::Repository
  def most_recent_successful_status_check
    status_checks.
      where(Sequel.lit(%(status != 'error'))).
      order { created_at.desc }.
      limit(1).
      one
  end
end
