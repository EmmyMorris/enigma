require_relative 'spec_helper'
require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  describe '#exists' do
    it 'exists' do
      enigma = Enigma.new
      expect(enigma).to be_an_instance_of(Enigma)
    end
  end

  describe '#encrypt' do
    it 'encrypts a message' do
       enigma = Enigma.new
       expected = {
           encryption: "keder ohulw",
           key: "02715",
           date: "040895"
         }
       expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
       expect(enigma.encrypt("hello world", "02715")).to eq({encryption: "skfazfqdbry", key: "02715", date: "042621"})
    end

    it 'find the offsets' do
      enigma = Enigma.new
      expect(enigma.offsets("040895")).to eq({:offset1=>1, :offset2=>0, :offset3=>2, :offset4=>5})
    end

    it 'finds the final shifts' do
      enigma = Enigma.new
      expect(enigma.final_shifts("02715", "040895")).to eq({:ashift=>3, :bshift=>27, :cshift=>73, :dshift=>20})
    end

    it 'assignes every letter of the message an index' do
      enigma = Enigma.new
      expect(enigma.index_of_letter).to eq({0=>"h", 1=>"e", 2=>"l", 3=>"l", 4=>"o", 5=>" ", 6=>"w", 7=>"o", 8=>"r", 9=>"l", 10=>"d"})
    end

    it 'assignes a shift to every index of a letter' do
      enigma = Enigma.new
      expect(enigma.shift_selector(0)).to eq(:ashift)
      expect(enigma.shift_selector(1)).to eq(:bshift)
      expect(enigma.shift_selector(2)).to eq(:cshift)
      expect(enigma.shift_selector(3)).to eq(:dshift)
    end

    it 'rotates' do
      enigma = Enigma.new
      expect(enigma.rotate("a", 3)).to eq('d')
    end

    it 'encrypts a message' do
      enigma = Enigma.new
      expect(enigma.encrypt_message("hello world", {:ashift=>3, :bshift=>27, :cshift=>73, :dshift=>20})).to eq("keder ohulw")
    end
  end

  describe '#decrypt' do
    it 'decrypts a message' do
      enigma = Enigma.new
      expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
       expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end

    it 'de-rotates' do
      enigma = Enigma.new
      expect(enigma.de_rotate("d", -3)).to eq('a')
    end

    it 'decrypts a message' do
      enigma = Enigma.new
      expect(enigma.decrypt_message("keder ohulw", {:ashift=>3, :bshift=>27, :cshift=>73, :dshift=>20})).to eq('hello world')
    end
  end
end
