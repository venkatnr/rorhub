class Article
  include Mongoid::Document
  field :title, :type => String
  field :description, :type => String
  belongs_to :user
  has_many :comments
end
