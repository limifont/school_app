FactoryGirl.define do
  factory :classroom, class: Classroom do
    name "Full Stack Rails"
    capacity 18
    active active
    school
  end
end
