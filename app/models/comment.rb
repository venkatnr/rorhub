class Comment
  include Mongoid::Document
  field :c_title, :type => String
  field :c_description, :type => String
  belongs_to :article
end
