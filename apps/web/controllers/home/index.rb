module Web::Controllers::Home
  class Index
    include Web::Action

    expose :is_open

    def call(params)
      status_check = StatusCheckRepository.new.most_recent_status_check
      raise 'No status checks found' unless status_check
      @is_open = status_check.is_open
    end
  end
end
