module EntriesHelper
  def pretty_weight(entry)
    number_with_precision(entry.weight, precision: 2,  strip_insignificant_zeros: true)
  end
end
