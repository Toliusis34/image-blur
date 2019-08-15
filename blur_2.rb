class Image
  def initialize(picture)
    @picture = picture
  end

  def output_image
    @picture.each do |data|
      puts data.join
    end
  end

  def get_ones
    ones = []
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, column_number|
        if item == 1
          ones << [row_number, column_number]
        end
      end
    end
    ones
  end

  def blur!
    ones = get_ones
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, column_number|
        ones.each do |found_row_number, found_column_number|
          if row_number == found_row_number && column_number == found_column_number
            @picture[row_number -1][column_number] = 1 unless row_number == 0
            @picture[row_number +1][column_number] = 1 unless row_number == row_number + 1
            @picture[row_number][column_number -1] = 1 unless column_number == 0
            @picture[row_number][column_number +1] = 1 unless column_number >= column_number + 1
          end
        end
      end
    end
  end
end

image = Image.new([
  [0,0,0,0,1,0],
  [0,0,1,0,0,0],
  [1,0,0,0,0,0],
  [0,1,0,0,0,0],
  [0,0,0,0,0,0]
])

image.blur!
image.output_image