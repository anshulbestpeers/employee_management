class Leave < ApplicationRecord
  belongs_to :employee

  enum :status, {hold: 0, accepted: 1, rejected: 2}, suffix: true
  enum :leave_type, {casual: 0, optional: 1, compoff: 2, paid: 3 }, suffix: true
  enum :from_session, {session1: 0, session2: 1}, suffix: true
  enum :to_session, {session1: 0, session2: 1}, suffix: true
end
