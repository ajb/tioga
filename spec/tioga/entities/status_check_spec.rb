require_relative '../../spec_helper'

describe StatusCheck do
  it 'can be initialized with attributes' do
    status_check = StatusCheck.new(is_open: false)
    status_check.is_open.must_equal false
  end
end
