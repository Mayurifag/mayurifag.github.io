require 'spec_helper'

describe 'index', type: :feature do
  before do
    visit '/'
  end

  it 'responds successfully' do
    expect(page.status_code).to eql(200)
  end

  it 'has developer name in text' do
    expect(page).to have_text 'Vladislav Ponomarev'
  end
end
