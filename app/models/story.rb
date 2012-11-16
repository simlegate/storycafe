class Story
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :user
  field :title
  field :description

end
