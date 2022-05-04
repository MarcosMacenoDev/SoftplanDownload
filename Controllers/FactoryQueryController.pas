unit FactoryQueryController;

interface

uses
  FactoryQueryControllerInterface, QueryInterface, ConexaoInterface;

type

  TFactoryQueryController = class(TInterfacedObject, iFactoryQuery)

  public

    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryQuery;
    function Query: iQuery;

  end;

implementation

uses
  QueryFiredacModel;

{ TFactoryQueryController }

constructor TFactoryQueryController.Create;
begin

end;

destructor TFactoryQueryController.Destroy;
begin

  inherited;

end;

class function TFactoryQueryController.New: iFactoryQuery;
begin

  Result := Self.Create;

end;

function TFactoryQueryController.Query: iQuery;
begin

  Result := TQueryFiredacModel.New;

end;

end.
