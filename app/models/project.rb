class Project
  include Mongoid::Document
  field :name , type: String
  belongs_to :user

  def self.new_project param
    create.(param)
  end
end
