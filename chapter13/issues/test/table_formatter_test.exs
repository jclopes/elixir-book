defmodule TableFormatterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias Issues.TableFormatter, as: TF

  def simple_test_data do
    [
      %{"c1" => "r1 c1", "c2"=> "r1 c2",  "c3" => "r1 c3", "c4" => "r1+++c4"},
      %{"c1" => "r2 c1", "c2"=> "r2 c2",  "c3" => "r2 c3", "c4" => "r2 c4"},
      %{"c1" => "r3 c1", "c2"=> "r3 c2",  "c3" => "r3 c3", "c4" => "r3 c4"},
      %{"c1" => "r4 c1", "c2"=> "r4++c2", "c3" => "r4 c3", "c4" => "r4 c4"}
    ]
  end

  def headers, do: [ "c1", "c2", "c4" ]

  test "extract_fields_and_widths" do
    field_widths = %{"c1" => 5, "c2" => 6, "c4"=> 7}
    clean_issues = [
      %{"c1" => "r1 c1", "c2"=> "r1 c2",  "c4" => "r1+++c4"},
      %{"c1" => "r2 c1", "c2"=> "r2 c2",  "c4" => "r2 c4"},
      %{"c1" => "r3 c1", "c2"=> "r3 c2",  "c4" => "r3 c4"},
      %{"c1" => "r4 c1", "c2"=> "r4++c2", "c4" => "r4 c4"}
    ]
    {res_clean_issues, res_field_widths} = TF.extract_fields_and_widths(simple_test_data, headers)
    assert res_field_widths == field_widths
    assert Enum.sort(res_clean_issues) == Enum.sort(clean_issues)
  end

  test "Output is correct" do
  result = capture_io fn ->
    TF.print_table_for_columns(simple_test_data, headers)
  end
  assert result == """
    c1    | c2     | c4     
    ------+--------+--------
    r1 c1 | r1 c2  | r1+++c4
    r2 c1 | r2 c2  | r2 c4  
    r3 c1 | r3 c2  | r3 c4  
    r4 c1 | r4++c2 | r4 c4  
    """
   end
end
