require 'rails_helper'

RSpec.describe Blog, type: :model do
  it "should have a user, title and message" do
    blog = Blog.new(title: "First blog!", message: "Hey guys this is my first blog post weeeeeeeee")
    new_user = User.new(full_name: 'Mrin Sin', email: 'mrin@sin.com', password: 'mrin')
    new_user.save
    blog.user = new_user
    expect(blog.save).to be true
    blog2 = Blog.find_by_title("First blog!")
    expect(blog2.message).to eq "Hey guys this is my first blog post weeeeeeeee"
  end
end
