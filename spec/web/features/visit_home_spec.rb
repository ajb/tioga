require 'features_helper'

describe 'Visit home' do
  def setup
    StatusCheckRepository.new.create(is_open: false)
  end

  it 'is successful' do
    visit '/'
    page.body.must_include('Tioga')
    page.body.must_include('Closed')
  end
end
