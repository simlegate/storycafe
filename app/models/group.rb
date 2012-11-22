class Group
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :user
  field :title
  field :description
  has_many :stories

  def self.get_group_by_group_id id
    find(id)
  end

  def self.get_group_default
     Group.find_by(title: "public")
  end

end
