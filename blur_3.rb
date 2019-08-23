class Image
  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |data|
      puts data.join
    end
  end

  def get_ones
    ones = []
    @image.each_with_index do |row, row_number|
      row.each_with_index do |item, column_number|
        if item == 1
          ones << [row_number, column_number]
        end
      end
    end
    ones
  end

  def blur!(blur_distance)
    ones = get_ones
    @image.each_with_index do |row, row_number|
      row.each_with_index do |item, column_number|
        ones.each do |found_row_number, found_column_number|
          if manhattan_distance(column_number, row_number, found_column_number, found_row_number) <= blur_distance
            @image[row_number][column_number] = 1
          end
        end
      end
    end
  end

  def manhattan_distance(x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    s = horizontal_distance + vertical_distance
    puts s
    s
  end
end

image = Image.new([
  [0,0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0,0],
  [0,0,1,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,1,0,0],
  [0,0,0,0,0,0,0,0,0,0,0,0]
])

image.blur!(2)
image.output_image