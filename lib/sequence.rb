class Sequence
  def initialize(data)
    @data = data
    @markers = []
  end

  def match(signal, open, close)
    i = 0
    j = 0
    while i = @data.index(signal, i + j)
      add_marker_at(i, {open: open})
      add_marker_at(i + signal.size - 1, {close: close})
      j = 1
    end
  end

  def with_signals_marked
    out = ""
    @data.each_char.each_with_index do |c, i|
      markers = markers_at(i)
      out << markers[:open] if markers[:open] 
      out << c
      out << markers[:close] if markers[:close]
    end
    out
  end

  def add_marker_at(index, delim)
    @markers[index] ||= {}
    @markers[index].merge!(delim)
  end

  def markers_at(index)
    @markers[index] || {}
  end
end