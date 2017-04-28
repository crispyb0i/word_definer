require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
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
  definition_fetch = params.fetch('definition')
  Definition.new({:definition_of_word => definition_fetch}).add_definition()
  erb(:definition)
end

get('/newdef') do
  @word = Word.find(params.fetch('id').to_i())
  @words = Word.all()
end

post('/newdef') do
  definition_fetch = params.fetch('definition')
  Definition.new({:definition_of_word => definition_fetch}).save()
  @defintions = Definition.all()
  erb(:definition)
end
