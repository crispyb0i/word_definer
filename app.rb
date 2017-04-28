require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/new') do
  word_fetch = params.fetch('word')
  Word.new({:word => word_fetch}).save()
  @words = Word.all()
  erb(:index)
end

get('/words/:id') do
   @word = Word.find(params.fetch('id').to_i())
   @words = Word.all()
  erb(:definition)
end

post('/words/:id') do
  @words = Word.all()
  @word = Word.find(params.fetch('id').to_i())
  definition_fetch = params.fetch('definition')
  new_definition = Definition.new({:definition => definition_fetch})
  @word.add_definition(new_definition)
  @word.save()
  erb(:definition)
end

# get('/newdef') do
#   # word = Word.find(params.fetch('id').to_i())
#   erb(:definition)
# end

post('/newdef/:id') do
  @words = Word.all()
  @word = Word.find(params.fetch('id').to_i())
  definition_fetch = params.fetch('definition')
  new_definition = Definition.new({:definition => definition_fetch})
  @word.add_definition(new_definition)
  erb(:definition)
end
