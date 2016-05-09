defmodule Issues.TableFormatter do

  def print_table_for_columns(issues, fields) do
    {clean_issues, field_widths} = extract_fields_and_widths(issues, fields)
    table_header(field_widths)
    |> Enum.each(&IO.puts/1)
    clean_issues
    |> Enum.map(&(format_row(&1, field_widths)))
    |> Enum.each(&IO.puts/1)
  end

  def extract_fields_and_widths(issues, fields) do
    init_field_widths = Enum.reduce(
      fields,
      Map.new(),
      fn(fname, acc) -> put_in(acc[fname], String.length(fname)) end
    )
    {clean_issues, field_widths} = Enum.reduce(
      issues, {[], init_field_widths}, &extract_fields0/2
    )
    {Enum.reverse(clean_issues), field_widths}
  end

  defp extract_fields0(issue, {issues, field_widths}) do
    {nissue, field_widths} = Enum.reduce(
      field_widths, {Map.new(), field_widths},
      fn({fname, fwidth}, {data_map, field_widths}) ->
        {value, width} = to_string_width(issue[fname])
        {
          put_in(data_map[fname], value),
          put_in(field_widths[fname], max(fwidth, width))
        }
      end
    )
    {[nissue|issues], field_widths}
  end

  def to_string_width(value) when is_binary(value), do: {value, String.length(value)}
  def to_string_width(value) do
    str_value = to_string(value)
    {str_value, String.length(str_value)}
  end

  def table_header(field_widths) do
    titles = Enum.map(
      field_widths,
      fn({k, w}) -> "#{String.ljust(k, w)}" end
    )
    |> Enum.join(" | ")
    
    line = Enum.map(
      field_widths,
      fn({_, w}) -> "#{String.ljust("", w, ?-)}" end
    )
    |> Enum.join("-+-")
    [titles, line]
  end

  def format_row(issue, field_widths) do
    for {fname, fwidth} <- field_widths do
      "#{String.ljust(issue[fname], fwidth)}"
    end
    |> Enum.join(" | ")
  end
end
