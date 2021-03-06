# == Schema Information
#
# Table name: attachments
#
#  id                      :integer          not null, primary key
#  attachable_id           :integer
#  attachable_type         :string(255)
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  updated_by_user_id      :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  description             :text
#

class Attachment < ActiveRecord::Base

	attr_accessible :attachable_id, 
					:attachable_type, 
					:attachment_content_type, 
					:attachment_file_name, 
					:attachment_file_size, 
					:attachment_updated_at,
					:attachment,
					:updated_by_user_id,
					:description

	belongs_to :attachable, :polymorphic => true

	belongs_to :updated_by_user, :class_name => 'User'

	has_attached_file :attachment, 
					  :path => ":rails_root/public/system/attachments/:hash.:extension",
					  :url  => "/system/attachments/:hash.:extension",
					  :hash_secret => "e17ac013aa7f8f2fd095edfa012edb8c"


	validates_attachment_presence :attachment
	validates_attachment_size :attachment, :less_than => 10.megabytes

end

