class Group
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :user
  field :title
  field :description
  has_many :stories

  def self.get_group_by_group_id id
    where(_id: id).first
  end

  def self.get_group_default
    find_by(title: "public")
  end

  def self.get_groups_default
    all
  end
end
