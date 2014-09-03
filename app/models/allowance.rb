# == Schema Information
#
# Table name: allowances
#
#  id         :integer         not null, primary key
#  empno      :string(255)
#  amount     :decimal(, )
#  atype      :string(255)
#  payroll_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
class Allowance < ActiveRecord::Base
  belongs_to :payroll
  attr_accessible :amount, :empno, :atype
end




