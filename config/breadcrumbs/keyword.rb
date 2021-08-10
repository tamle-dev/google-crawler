# index
crumb :keywords do
  parent :root
  link 'Keyword', keywords_path
end

# show
crumb :keyword do |obj|
  parent :root
  link ::Keyword.model_name.human(count: 2), keywords_path
  link obj.id, keyword_path(obj)
end