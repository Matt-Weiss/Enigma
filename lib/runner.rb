require './lib/enigma'

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
    if argv.length == 2
      self.encrypt
    else
      self.decrypt(argv)
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

end
