# frozen_string_literal: true

require "spec_helper"

describe "Main page", type: :feature do
  before { visit "/" }

  it "has developer name in text" do
    expect(page.status_code).to eql(200)
    expect(page).to have_text "Vladislav Ponomarev"
  end
end
