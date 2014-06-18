class Character < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :actor, presence: true

  belongs_to :television_show
end
