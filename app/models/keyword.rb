class Keyword < ApplicationRecord
  has_many :keyword_details
  belongs_to :keyword_csv, class_name: 'Attachment', foreign_key: :keyword_attachment_id, optional: true
  belongs_to :result_html, class_name: 'Attachment', foreign_key: :result_attachment_id, optional: true

  accepts_nested_attributes_for :keyword_details

  delegate :file_url, :file_name,
           to: :keyword_csv,
           prefix: true,
           allow_nil: true

  delegate :file_url, :file_name,
           to: :result_html,
           prefix: true,
           allow_nil: true
end
