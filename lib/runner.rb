require './lib/enigma'
require 'pry'

class Runner

  def self.read_message_from_file(file_name)
    file_path = "./data/#{file_name}"
    file = File.new(file_path)
    @input = file.read.chomp
  end

  def self.create_write_file(file_name)
    @output_name = file_name
    file_path = "./data/#{file_name}"
    @output_file = File.open(file_path, "w")
  end

  def self.start(argv)
    read_message_from_file(argv[0])
    create_write_file(argv[1])
    if $0 == "./lib/encrypt.rb"
      self.encrypt
    elsif $0 == "./lib/decrypt.rb"
      self.decrypt(argv)
    else
      self.crack
    end
  end

  def self.encrypt
    enigma = Enigma.new
    encrypted = enigma.encrypt(@input)
    @output_file.write(encrypted[:encryption])
    @output_file.close
    puts "Created #{@output_name} with the key #{encrypted[:key]} and date #{encrypted[:date]}"
  end

  def self.decrypt(argv)
    enigma = Enigma.new
    decrypted = enigma.decrypt(@input, argv[2], argv[3])
    @output_file.write(decrypted[:decryption])
    @output_file.close
    puts "Created #{@output_name} with the key #{decrypted[:key]} and date #{decrypted[:date]}"
  end

  def self.crack(argv)
    enigma = Enigma.new
    cracked = enigma.crack(@input, argv[2])
    @output_file.write(cracked[:decryption])
    @output_file.close
    puts "Created #{@output_name} with the key #{cracked[:key]} and date #{cracked[:date]}"
  end
end
