ActiveRecord::Schema.define do
  self.verbose = false
  create_table :users, :force => true do |t|
    t.string :name
    t.string :email
  end
  create_table :posts, :force => true do |t|
    t.integer :user_id
    t.string :title
  end
end
class User < ActiveRecord::Base
  has_many :posts
end
class Post < ActiveRecord::Base
  belongs_to :user
end
users = User.create([
  {:name => 'John', :email => 'john@example.com'},
  {:name => 'Pearl', :email => 'pearl@example.com'},
  {:name => 'Kathenrie', :email => 'kathenrie@example.com'},
])
Post.create([
  {:title => "John's post1", :user_id => users[0].id},
  {:title => "John's post2", :user_id => users[0].id},
  {:title => "John's post3", :user_id => users[0].id},
  {:title => "Pearl's post1", :user_id => users[1].id},
  {:title => "Pearl's post2", :user_id => users[1].id},
  {:title => "Kathenrie's post1", :user_id => users[2].id},
])
