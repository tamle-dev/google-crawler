class Keyword < ApplicationRecord
  has_many :keyword_details, -> { order('position asc') }
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

  def total_result_text
    return unless total_result

    "#{total_result.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
  end

  def total_result_time_text
    return unless total_result_time
    
    "#{total_result_time_in_second.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse} seconds"
  end

  def total_result_time_in_second
    total_result_time.to_f / 1000
  end

  def crawled?
    !result_attachment_id.nil?
  end
end
