require_relative 'sequence'

class Finder
  def run
    File.open('data/signals.csv') do |f|
      @signals = f.read.split(",").collect {|s| s.upcase}
    end

    Dir.glob("data/*.dat").each do |filename|
      File.open(filename) do |f|
        sequence = Sequence.new(f.read.gsub("\n", "").gsub(" ", "").upcase)
        @signals.each do |signal|
          sequence.match(signal, "<", ">")  
        end
        File.open(filename.gsub("data", "out"), "w") do |out|
          out.write sequence.with_signals_marked
        end
      end
    end
  end
end