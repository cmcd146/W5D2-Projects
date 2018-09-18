# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint(8)        not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
  validates :post_id, uniqueness: { scope: :sub_id }
  
  belongs_to :post,
  foreign_key: :post_id,
  class_name: :Post
  
  belongs_to :sub,
  foreign_key: :sub_id,
  class_name: :Sub
  
  has_many :post_url
end
