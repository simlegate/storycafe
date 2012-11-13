class User 
  include Mongoid::Document

  field :name,type: String
  field :sex, type: String

end
