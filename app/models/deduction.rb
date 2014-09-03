# == Schema Information
#
# Table name: deductions
#
#  id         :integer         not null, primary key
#  empno      :string(255)
#  amount     :decimal(, )
#  dtype      :string(255)
#  dedtype    :string(255)
#  payroll_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
class Deduction < ActiveRecord::Base
  belongs_to :payroll
  attr_accessible :amount, :dedtype, :empno, :dtype
end




