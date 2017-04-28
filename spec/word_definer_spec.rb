require('rspec')
require('word')

describe(Definition) do
  before() do
    Word.clear()
  end

  describe("#save") do
    it("pushes a word to an array that holds all the words") do
      test_word = Word.new({:word => "Hulk"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties the array that holds all the definitions") do
      test_definition = Word.new({:word => "Hulk"}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
end
