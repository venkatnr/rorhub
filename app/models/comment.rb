class Comment
  include Mongoid::Document
  field :c_name, :type => String
  field :c_description, :type => String
  field :c_approval_status, :type => String
  belongs_to :article
end
