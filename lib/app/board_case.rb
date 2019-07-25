class BoardCase
  attr_accessor :case, :id_case

  def initialize(id_case)
      @case = " "
      @id_case = id_case
  end

  def change_case(symbol)
      @case = symbol
  end
end