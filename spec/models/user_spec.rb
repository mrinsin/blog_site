require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have a full name, email and password' do
    user = User.new(full_name: 'Mrin Sin', email: 'mrin@sin.com', password: 'mrin')
    expect(user.save).to be true
    user2 = User.find_by_full_name('Mrin Sin')
    expect(user2.email).to eq 'mrin@sin.com'
    expect(user2.password).to eq 'mrin'    
  end
end
