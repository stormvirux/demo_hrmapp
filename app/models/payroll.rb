# == Schema Information
#
# Table name: payrolls
#
#  id         :integer         not null, primary key
#  empno      :string(255)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  totsal     :decimal(, )
#  dedperday  :decimal(, )
#

class Payroll < ActiveRecord::Base
  attr_accessible :empno, :name,:allowances_attributes,:deductions_attributes
  has_many :allowances, dependent: :destroy
  has_many :deductions, dependent: :destroy
  accepts_nested_attributes_for :allowances,allow_destroy: true
  accepts_nested_attributes_for :deductions,allow_destroy: true
  validates :empno, presence: true, uniqueness:{ case_sensitive: false }
  validates_length_of :empno, :minimum => 5, :maximum => 5
  before_save :create_fullname
  before_save :saltotal
  def create_fullname
    emp = Employee.find_by_empno(self.empno)
    self.name= "#{emp.first_name} #{emp.last_name}"   
  end
  def saltotal
    self.totsal ||= 0.0
    rem ||=0.0
    tot ||=0.0
    #self.allowances.each do |allowance|
    #  self.totsal+=allowance.amount
    #end
    #self.deductions.each do |deduction|
    #  self.totsal-=deduction.amount
    #end  
    self.totsal=allowances.map(&:amount).sum-deductions.map(&:amount).sum
    emp=Leaveroll.find_by_empno(self.empno)
    avail=Setting.find(1)
    if emp.totdays>avail.leave
      rem=emp.totdays-avail.leave
      tot=avail.dedperday*rem
    end
    self.totsal-=tot
  end
end

