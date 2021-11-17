require 'student'

describe Student do
  it 'has a name' do
    stu = Student.new("John", "ansel054@umn.edu")
    expect(stu.name).to eq "John"
    expect(stu.email).to eq "ansel054@umn.edu"
  end
end


