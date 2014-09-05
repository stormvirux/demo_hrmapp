class Setting < ActiveRecord::Base
  attr_accessible :cur, :leave
end
# == Schema Information
#
# Table name: settings
#
#  id         :integer         not null, primary key
#  leave      :integer
#  cur        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

