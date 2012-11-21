require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"

    let :attrs do
     {
      :user => 'byronlee',
      :title     => 'public',
      :description    => 'this is a public group',
     }
    end

    describe "create a group" do
      it "create a group" do
        Group.create(attrs).should be_valid
      end
    end

end
