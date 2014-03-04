class Aquizition2 < ActiveRecord2::Base
  attr_accessor :fields
  def populate
    self.fields ||= self.file_lines.split('^')
    self.fields_size = @fields.size
    save!
  end

  def reload_line(file)
    line = [*file][self.id-1]
    self.file_lines = line.encode("utf-8").gsub(/\t/, '')
    populate
  end

end
