class Leave < ApplicationRecord
  belongs_to :employee
  before_create :total_days

  enum :status, {hold: 0, accepted: 1, rejected: 2}, suffix: true
  enum :leave_type, {casual: 0, optional: 1, compoff: 2, paid: 3 }, suffix: true
  enum :from_session, {session1: 0, session2: 1}, suffix: true
  enum :to_session, {session1: 0, session2: 1}, suffix: true

  private

  def total_days
    self.days = (to_date - from_date).to_i + 1
  end
end
