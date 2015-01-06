class Challenge < ActiveRecord::Base
  has_many :tasks
  has_many :entries
  has_many :members, through: :entries, source: :user
  belongs_to :user

  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true

  scope :active, -> { where("ends_at > ?", Time.now) }
  scope :joined_by_user, ->(user) { joins(:entries).where("entries.user_id = ?", user.id) }
end
