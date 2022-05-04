unit QueryInterface;

interface

uses
  Data.DB;

type

  iQuery = interface

    ['{0C792556-1224-43CB-8AA3-3BE0B851042A}']
    function SQL(Value: String): iQuery;
    function DataSet: TDataSet;
    function Execute(Value: String): iQuery;

  end;

implementation

end.
