class Code
  attr_reader :code

  def initialize
    @colors = %w[red blue green orange yellow brown]
    @code = []
  end

  def select
    (0..3).each do |i|
      @code[i] = @colors.sample
    end
  end
end
