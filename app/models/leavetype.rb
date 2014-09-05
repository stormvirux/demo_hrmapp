class Leavetype < ActiveRecord::Base
  attr_accessible :ltype
end
# == Schema Information
#
# Table name: leavetypes
#
#  id         :integer         not null, primary key
#  ltype      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

