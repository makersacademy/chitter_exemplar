class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :content, Text, required: true
  property :created_at, DateTime

  def self.all_in_reverse_order
    self.all(order: :created_at.desc)
  end
end
