class Movie < Product
  def initialize(params)
    super
    @name = params[:name]
    @director = params[:director]
    @year = params[:year]
  end
  def to_s
    "From the #{@director} a movie \'#{@name}\' filmed in #{@year}. " + super
  end
end
