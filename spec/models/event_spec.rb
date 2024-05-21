require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:creator).class_name('User').with_foreign_key('creator_id') }
  it { should have_many(:event_attendances).with_foreign_key('attended_event_id') }
  it { should have_many(:attendees).through(:event_attendances).source(:attendee) }

  describe '#scopes' do
    before do
      @upcoming_event = Event.create(date: 1.day.from_now, creator: User.create)
      @past_event = Event.create(date: 1.day.ago, creator: User.create)
    end

    it 'includes events with a date in the past' do
      expect(Event.past).to include(@past_event)
    end

    it 'includes events with a date in the future' do
      expect(Event.upcoming).to include(@upcoming_event)
    end

    it 'does not contain events planned for future dates' do
      expect(Event.past).not_to include(@upcoming_event)
    end

    it 'does not contain events planned for past dates' do
      expect(Event.upcoming).not_to include(@past_event)
    end
  end
end
