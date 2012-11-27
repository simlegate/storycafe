class Log
  include Mongoid::Document
  field :content , type: String
  field :isread ,type: Boolean , default: false

  def self.set_message_isread id
    find(id).update_attribute(:isread,true)
  end

  def self.get_unread_message
    find_by(isread: false)
  end

  def self.new_message msg
    create(content: msg)
  end

end
