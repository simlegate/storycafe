# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :story do
    title "this is story"
    current_status "new"
    next_status "finished"
    user
    group
  end


end
