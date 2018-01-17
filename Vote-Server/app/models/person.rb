class Person < ApplicationRecord
	self.table_name = :people

	has_attached_file :pic_url, :whiny => false, :styles => {:thumb => "100x100>", :small => "200x200>"}, :url => "/upload/:class/:id/:style/:basename.:extension",:default_url=> "/upload/missing.png"
	do_not_validate_attachment_file_type :pic_url

end
