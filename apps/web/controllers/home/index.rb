module Web::Controllers::Home
  class Index
    include Web::Action

    expose :most_recent_status

    def call(params)
      status_check = StatusCheckRepository.new.most_recent_successful_status_check
      raise 'No recent status checks found' unless status_check && status_check.recent?
      @most_recent_status = status_check.status
    end
  end
end
