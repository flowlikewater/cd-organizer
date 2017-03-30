require('rspec')
require('cd_organizer')

describe(Cd) do
  before() do
    Cd.clear()
  end
end

describe('#add_cd') do
  it("#title") do
    test_album = Cd.new({:title => "reggae shark"})
    expect(test_album.title()).to(eq("reggae shark"))
  end
end

describe('.display') do
  it(".display") do
    expect(Cd.display()).to(eq([]))
  end
end

describe('add_cd to array') do
  it('#add') do
    test_album = Cd.new({:title => "reggae shark"})
    test_album.add()
    expect(Cd.display()).to(eq([test_album]))
  end
end

describe('clear') do
  it('#clear') do
    test_album = Cd.new({:title => "reggae shark"})
    test_album.add()
    Cd.clear()
    expect(Cd.display()).to(eq([]))
  end
end

describe('add id') do
  it('#addid') do
    test_album = Cd.new({:title => "reggae shark"})
    expect(test_album.id()).to(eq(1))
  end
end

describe('find an album object ') do
  it('.find') do
    test_album = Cd.new({:title => "reggae shark"})
    test_album.add
    test_album2 = Cd.new({:title => "reggae dog"})
    test_album2.add
    expect(Cd.find(test_album.id)).to(eq(test_album))
  end
end
