module PreferencesHelper
  def vacation_header(vacation)
    "#{vacation.name}: #{date_range(vacation)}"
  end
end
