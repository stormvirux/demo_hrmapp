# == Schema Information
#
# Table name: leaverolls
#
#  id         :integer         not null, primary key
#  empno      :string(255)
#  ltype      :string(255)
#  lfrom      :date
#  lto        :date
#  totdays    :integer
#  notes      :text
#  approved   :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  name       :string(255)
#
class Leaveroll < ActiveRecord::Base
  attr_accessible :approved, :empno, :lfrom, :lto, :ltype, :notes, :totdays
  before_save :totalhol
  before_save :create_fullname
  before_save :dedextra
  def totalhol
  	self.totdays=self.lto-self.lfrom
  end
  def create_fullname
    emp = Employee.find_by_empno(self.empno)
    self.name= "#{emp.first_name} #{emp.last_name}"   
  end
  def lprogress
    avail=Setting.find(1)
    avail=avail.leave
    (Float(self.totdays)/Float(avail))*100.0
  end
  def dedextra
    emp=Payroll.find_by_empno(self.empno)
    emp.save
  end
end




# == Schema Information
#
# Table name: leaverolls
#
#  id         :integer         not null, primary key
#  empno      :string(255)
#  ltype      :string(255)
#  lfrom      :date
#  lto        :date
#  totdays    :integer
#  notes      :text
#  approved   :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  name       :string(255)
#

