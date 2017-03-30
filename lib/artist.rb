require('pry')
class Artist

  @@artists = []

  attr_reader(:name)
  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @artistcds = []
  end

  define_method(:artistcds) do
    @artistcds
  end

  define_method(:addalbum) do |album|
    @artistcds.push(album)
  end

  define_singleton_method(:all) do
    @@artists
  end

  define_singleton_method(:clear) do
    @@artists.clear()
  end

  define_method(:saveartist) do
    @@artists.push(self)
  end

  define_singleton_method(:removeartist) do |bye|
    @@artists.each do |artist|
      if bye == artist
        @@artists.delete(artist)
      end
    end
  end

  define_singleton_method(:find) do |name|
    found = nil
    @@artists.each do |artist|
      if artist.name == name
        found = artist
      end
    end
    return found
  end

end
