module ApplicationHelper
  def self.populate_all
    # Aquizition.first(5).each do |a|
    Aquizition.find_each(batch_size: 5000) do |a|
      a.populate
    end
  end
  def self.reload_small_lines
    # f = File.open('/home/andrei/Dev/Git-repos/odd-csv-cleaner/oddacquisitions/aquizitions_raw.csv')
    
    File.open("/home/andrei/Dev/Git-repos/odd-csv-cleaner/oddacquisitions/aquizitions_raw.csv", "r") do |fh|
      Aquizition.where("fields_size <> ?", 20) do |a|
        a.reload_line(fh)
      end
    end

    Nil
    # Aquizition.where("fields_size <> ?", 20) do |a|
    #   a.reload_line(f)
    # end
    # f.close
  end
end
