require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/artist')
require('./lib/cd_organizer')

get('/') do
  erb(:index)
end

get('/album/new') do
  erb(:album_form)
end

get('/albums') do
  @cds = Cd.display
  erb(:albums)
end

post('/artists') do
  name = params.fetch('name')
  id = params.fetch('id')
  album = Cd.find((id).to_i())
  @artist = Artist.new({:name => name})
  @artist.addalbum(album)
  @artist.saveartist()
  erb(:success)
end

post('/albums') do
  title = params.fetch('title')
  @cd = Cd.new({:title => title})
  @cd.add()
  erb(:success)
end

get('/albums/:id') do
  @album = Cd.find(params.fetch('id').to_i())
  erb(:album)
end
