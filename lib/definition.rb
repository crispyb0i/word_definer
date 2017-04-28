class Definition
  @@definitions = []

  attr_accessor(:definition_of_word, :id)

  define_method(:initialize) do |attributes|
    @definition_of_word = attributes.fetch(:definition_of_word)
    @id = @@definitions.length().+(1)
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |identification|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id.eql?(identification)
        found_definition = definition
      end
    end
    found_definition
  end
end
