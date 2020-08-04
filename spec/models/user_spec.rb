require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(username: 'Anything',
                        fullname: 'Anything',
                        created_at: DateTime.now,
                        updated_at: DateTime.now + 1.week,
                        id: 1)
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a title' do
    subject.fullname = nil
    expect(subject).not_to be_valid
  end

  describe 'associations' do
    it { should have_many(:hints).dependent(:destroy) }
    # rubocop:disable Metrics/LineLength
    it { should have_many(:active_relationships).class_name('Follower').with_foreign_key('follower_id').dependent(:destroy) }
    it { should have_many(:passive_relationships).class_name('Follower').with_foreign_key('followed_id').dependent(:destroy) }
    # rubocop:enable Metrics/LineLength
  end
end
