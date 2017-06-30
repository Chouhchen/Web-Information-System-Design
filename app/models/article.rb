class Article < ActiveRecord::Base
  belongs_to :user
  scope :latest ,->{order('updated_at desc')}
  validates_presence_of :title, :body
end
def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end