class Home
  include Mongoid::Document
  field :name, :type => String
  #association
  belongs_to :user
end
