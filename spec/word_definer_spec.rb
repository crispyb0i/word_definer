require('rspec')
require('word')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("#save") do
    it("pushes a definition to an array that holds all the definitions") do
      test_definition = Definition.new({:definition_of_word => "A person who is really strong"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe("#save") do
    it("pushes a definition to an array that holds all the definitions") do
      test_word = Word.new({:word => "Hulk"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties the array that holds all the definitions") do
      test_definition = Definition.new({:definition_of_word => "A person who is really strong."}).save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
end
