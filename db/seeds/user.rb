unless User.exists?
  p 'Import User.........'
  User.create(email: 'admin@nimblehq.co', password: '123456')
end
