Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:attachment/:user_id/:filename'

Paperclip::Attachment.default_options.merge!(
  storage:              :s3,
  url:                  ':s3_domain_url',
  path:                 ':class/:id/:filename',
)