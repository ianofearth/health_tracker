require 'rails_helper'

describe Exercise do
  it { should validate_presence_of :name }
  it { should validate_presence_of :burned }

  it { should belong_to :user }
end
