module Dedent
  def dedent(string)
    indent = 10_000_000

    string.lines do |line|
      length = line.sub(/^( *).*$/, '\1').length
      indent = length if length < indent
    end

    string.split("\n").map { |line| line[(indent-1)..-1] }.join("\n")
  end
end

RSpec.configure do |config|
  config.include(Dedent)
end
