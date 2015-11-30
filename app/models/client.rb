class Client < ActiveRecord::Base

  has_many :patients

  before_validation do
    self.name = name.strip.downcase.split.map(&:capitalize).join(" ") if name.present?
    self.email = email.strip.downcase if email.present?
    self.phone = phone.strip.gsub(/[^0-9]/, '') if phone.present?
    self.cellphone = cellphone.strip.gsub(/[^0-9]/, '') if cellphone.present?
  end

  # ////////////////////////////////////////////////////////////////////////////////

  scope :ci_where, lambda { |attribute, value| where("lower(#{attribute}) LIKE ?", "%#{value.downcase}%") }

  #//////////////////////////////////////////////////////////////////////////////////

  validates :name, presence: true

end
