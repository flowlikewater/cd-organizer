require('pry')
class Cd

  @@cds=[]

  attr_reader(:title)
  define_method(:initialize) do |attr|
    @title = attr.fetch(:title)
    @id = @@cds.length() + 1
  end

  define_method(:add) do
    @@cds.push(self)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:display) do
    @@cds
  end

  define_singleton_method(:clear) do
    @@cds.clear
  end

  define_singleton_method(:find) do |id|
    chosen = nil
    @@cds.each do |cd|
      if cd.id == id
        chosen = cd
      end
    end
    chosen
  end




end
