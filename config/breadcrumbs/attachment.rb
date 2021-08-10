# index
crumb :attachments do
  parent :root
  link 'Attachment', attachments_path
end

# show
crumb :attachment do |obj|
  parent :root
  link ::Attachment.model_name.human(count: 2), attachments_path
  link obj.id, attachment_path(obj)
end

# new
crumb :new_attachment do
  parent :root
  link ::Attachment.model_name.human(count: 2), attachments_path
  link I18n.t('helpers.breadcrumbs.new', default: 'New')
end

# edit
crumb :edit_attachment do |obj|
  parent :root
  link ::Attachment.model_name.human(count: 2), attachments_path
  link obj.id, attachment_path(obj)
  link I18n.t('helpers.breadcrumbs.edit', default: 'Edit')
end
