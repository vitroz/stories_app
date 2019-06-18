class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_stories, class_name: 'Story',
    foreign_key: 'creator_id'
  has_many :written_stories, class_name: 'Story',
    foreign_key: 'writer_id'
  has_many :reviewed_stories, class_name: 'Story',
    foreign_key: 'reviewer_id'

  belongs_to :role

end
