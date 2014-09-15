module CodeHelper
  def code_block(indent, code)
    '<code class="block">' +
    h(code.lines.map do |line|
      line.slice(indent..-1)
    end.join) +
    '</code>'
  end
end