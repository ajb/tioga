class StatusCheckRepository < Hanami::Repository
  def most_recent_successful_status_check
    status_checks.
      where(Sequel.lit(%(status != 'error'))).
      order { created_at.desc }.
      limit(1).
      one
  end

  def clear_old_statuses!
    # This is silly!
    Hanami::Model.configuration.connection.run(
      Sequel.lit('DELETE FROM status_checks where created_at < ?', 1.week.ago)
    )
  end
end
