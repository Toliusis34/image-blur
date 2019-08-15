class Image
  image = []

  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |array|
      array.each do |row|
        print row
      end
      puts ""
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image