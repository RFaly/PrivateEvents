require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:created_events).class_name('Event').with_foreign_key('creator_id') }
  it { should have_many(:event_attendances).with_foreign_key('attendee_id') }
  it { should have_many(:attended_events).through(:event_attendances).source(:attended_event) }
end
