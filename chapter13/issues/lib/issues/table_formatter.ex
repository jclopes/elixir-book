defmodule Issues.TableFormatter do

  @doc """
  Takes a list of row data, where each row is a Map, and a list of headers. Prints a 
  table to STDOUT of the data from each row identified by each header. That is, each
  header identifies a column, and those columns are extracted and printed from the 
  rows.0

  We calculate the width of each column to fit the longest element in that column.
  """
  def print_table_for_columns(issues, fields) do
    {clean_issues, field_widths} = extract_fields_and_widths(issues, fields)
    table_header(field_widths)
    |> Enum.each(&IO.puts/1)
    clean_issues
    |> Enum.map(&(format_row(&1, field_widths)))
    |> Enum.each(&IO.puts/1)
  end

  @doc """
  Given a list of rows, where each row contains a keyed list of columns, return a 
  tuple where the first element is a list of data rows containing only the columns
  we care about and the second element is a map of the columns to the width of the
  largest element.
  """
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

  @doc """
  Given a value of any type return the string representation and the string length
  of that value.
  ## Example
       iex> Issues.TableFormatter.to_string_width(123)
       {"123", 3}
  """
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
