require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  it { should belong_to(:attendee).class_name('User') }
  it { should belong_to(:attended_event).class_name('Event') }
end
