class Sequence
  def initialize(data)
    @data = data
    @delims = []
  end

  def match(signal, open, close)
    i = 0
    j = 0
    while i = @data.index(signal, i + j)
      add_delim_at(i, {open: open})
      add_delim_at(i + signal.size - 1, {close: close})
      j = 1
    end
  end

  def with_delimiters
    out = ""
    @data.each_char.each_with_index do |c, i|
      delims = delims_at(i)
      out << delims[:open] if delims[:open] 
      out << c
      out << delims[:close] if delims[:close]
    end
    out
  end

  def add_delim_at(index, delim)
    @delims[index] ||= {}
    @delims[index].merge!(delim)
  end

  def delims_at(index)
    @delims[index] || {}
  end
end