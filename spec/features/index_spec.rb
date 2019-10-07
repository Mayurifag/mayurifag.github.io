# frozen_string_literal: true

require 'spec_helper'

describe 'Main page', type: :feature do
  before { visit '/' }

  it 'responds successfully [status 200]' do
    expect(page.status_code).to eql(200)
  end

  it 'has developer name in text' do
    expect(page).to have_text 'Vladislav Ponomarev'
  end

  it 'has job position in text' do
    expect(page).to have_text 'Team Lead'
  end
end
