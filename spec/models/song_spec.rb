require 'rails_helper'

RSpec.describe Song, type: :model do
  context "validations" do
    it { should belong_to(:artist)}
    it { is_expected.to validate_presence_of(:title) }
  end
end
