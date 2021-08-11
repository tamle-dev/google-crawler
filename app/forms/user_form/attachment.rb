# UserForm::Attachment
module UserForm
  class Attachment < ::Attachment
    validates :file,
            file_size: { less_than_or_equal_to: 100.megabytes },
            file_content_type: {
              allow: [
                'text/csv'
              ]
            },
            presence: true
  end
end
