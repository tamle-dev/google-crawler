class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attachments
  
  has_many :keywords, through: :attachments

  has_many :keyword_csv_attachments, through: :keywords, source: :keyword_csv
  has_many :result_html_attachments, through: :keywords, source: :result_html
end
