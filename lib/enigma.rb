require 'date'
class Enigma
  ALPHABET_HASH = {'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5,
                  'g' => 6, 'h' => 7, 'i' => 8, 'j' => 9, 'k' => 10, 'l' => 11,
                  'm' => 12, 'n' => 13, 'o' => 14, 'p' => 15, 'q' => 16, 'r' => 17,
                  's' => 18, 't' => 19, 'u' => 20, 'v' => 21, 'w' => 22, 'x' => 23,
                  'y' => 24, 'z' => 25, ' ' => 26}

  def encrypt(message, key = ("0" + rand.to_s[2..5]), date = (Date.today).strftime("%m%d%y"))
    final_offsets = offsets(date)
    final_shifts_hash = final_shifts(key, date)
    encrypt_message(message, final_shifts_hash)
    {encryption: encrypt_message(message, final_shifts_hash), key: key, date: date}
  end

  def offsets(date)
    sqrt_num = (date.to_i)**2
    last_4_num = (sqrt_num.to_s).chars.last(4).join
    {offset1: last_4_num[0].to_i, offset2: last_4_num[1].to_i, offset3: last_4_num[2].to_i, offset4: last_4_num[3].to_i}
  end

  def final_shifts(key, date)
    final_offsets = offsets(date)
    keys = {key1: key[0..1].to_i, key2: key[1..2].to_i, key3: key[2..3].to_i, key4: key[3..4].to_i}
    {ashift: (final_offsets[:offset1] + keys[:key1]),
    bshift: (final_offsets[:offset2] + keys[:key2]),
    cshift: (final_offsets[:offset3] + keys[:key3]),
    dshift: (final_offsets[:offset4] + keys[:key4])}
  end

  def index_of_letter
    message = "hello world"
    split_message = message.downcase.split('')
    hash = Hash.new
    split_message.each_with_index do |letter, index|
      hash[index] = letter
    end
    hash
  end

  def shift_selector(index_of_letter)
    i = index_of_letter + 1
    case
    when i % 4 == 0
      :dshift
    when (i - 3) % 4 == 0
      :cshift
    when (i - 2) % 4 == 0
      :bshift
    else
      :ashift
    end
  end

  def rotate(letter, shift_number)
    beginning_number = ALPHABET_HASH[letter]
    final_number = beginning_number + shift_number
    ALPHABET_HASH.keys.rotate(final_number).first
  end

  def encrypt_message(message, final_shifts_hash)
    encrypted_message = []
    split_message = message.downcase.split('')
    split_message.each_with_index do |letter, index|
      shift_letter = shift_selector(index)
      shift_number = final_shifts_hash[shift_letter]
      encrypted_message << rotate(letter, shift_number)
    end
    encrypted_message.join
  end

  def decrypt(message, key, date = (Date.today).strftime("%m%d%y"))
    final_offsets = offsets(date)
    final_shifts_hash = final_shifts(key, date)
    decrypt_message(message, final_shifts_hash)
    {decryption: decrypt_message(message, final_shifts_hash), key: key, date: date}
  end

  def de_rotate(letter, shift_number)
    beginning_number = ALPHABET_HASH[letter]
    final_number = beginning_number + shift_number
    ALPHABET_HASH.keys.rotate(final_number).first
  end

  def decrypt_message(message, final_shifts_hash)
    decrypted_message = []
    split_message = message.downcase.split('')
    split_message.each_with_index do |letter, index|
      shift_letter = shift_selector(index)
      shift_number = (final_shifts_hash[shift_letter]).to_s
      decrypted_message << de_rotate(letter, ("-" + shift_number).to_i)
    end
    decrypted_message.join
  end
end
