require('rspec')
require('artist')
require('cd_organizer')

describe('look for artistcds') do
  it('#artistcds') do
    test_artist = Artist.new({:name => "bob"})
    expect(test_artist.artistcds()).to(eq([]))
  end
end

describe('push artist cds') do
  it("#addalbum") do
    test_artist = Artist.new({:name => "bob"})
    test_album = Cd.new({:title => "reggae shark"})
    test_artist.addalbum(test_album)
    expect(test_artist.artistcds()).to(eq([test_album]))
  end
end

describe('.all') do
  it('empty at first') do
    expect(Artist.all()).to(eq([]))
  end
end

describe('adds artists') do
  it('.saveartist') do
    test_artist = Artist.new({:name => "bob"})
    test_artist.saveartist()
    expect(Artist.all()).to(eq([test_artist]))
  end
end

describe('clear') do
  it('.clear') do
    test_artist = Artist.new({:name => "bob"})
    test_artist.saveartist()
    Artist.clear()
    expect(Artist.all()).to(eq([]))
  end
end

describe('delete a specific Artist') do
  it('.removeartist') do
    test_artist1 = Artist.new({:name => "bob"})
    test_artist2 = Artist.new({:name => "michael"})
    test_artist3 = Artist.new({:name => "bee"})
    test_artist1.saveartist()
    test_artist2.saveartist()
    test_artist3.saveartist()
    Artist.removeartist(test_artist2)
    expect(Artist.all()).to(eq([test_artist1, test_artist3]))
  end
end

describe('find') do
  it('.find') do
    test_artist = Artist.new({:name => "bob"})
    test_artist1 = Artist.new({:name => "ken"})
    test_artist.saveartist()
    test_artist1.saveartist()
    expect(Artist.find('bob')).to(eq(test_artist))
  end
end
