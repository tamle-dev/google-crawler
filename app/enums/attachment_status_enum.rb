# include AttachmentStatusEnum
module AttachmentStatusEnum
  extend Enumerize

  ATTACHMENT_STATUS_PENDING    = 10
  ATTACHMENT_STATUS_COMPLETED  = 200
  ATTACHMENT_STATUS_FAILED     = 500

  enumerize :status,
            in: {
              pending:    ATTACHMENT_STATUS_PENDING,
              completed:  ATTACHMENT_STATUS_COMPLETED,
              failed:     ATTACHMENT_STATUS_FAILED
            },
            default: :pending,
            predicates: { prefix: true },
            scope: true,
            i18n_scope: ['enums.status']
end

