unit QueryFiredacModel;

interface

uses
  QueryInterface, ConexaoInterface, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB;

type

  TQueryFiredacModel = class(TInterfacedObject, iQuery)

  private

    //FParent: iConexao;
    FQuery: TFDQuery;

  public

    constructor Create;
    destructor Destroy; override;
    class function New: iQuery;
    function SQL(Value: String): iQuery;
    function DataSet: TDataSet;
    function Execute(Value: String): iQuery;

  end;

implementation

uses
  System.SysUtils, ConexaoFiredacModel;

{ TQueryFiredacModel }

constructor TQueryFiredacModel.Create;
begin

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;

end;

function TQueryFiredacModel.DataSet: TDataSet;
begin

  Result := FQuery;

end;

destructor TQueryFiredacModel.Destroy;
begin

  FreeAndNil(FQuery);
  inherited;

end;

function TQueryFiredacModel.Execute(Value: String): iQuery;
begin

  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
  FQuery.ExecSQL;

end;

class function TQueryFiredacModel.New: iQuery;
begin

  Result := Self.Create;

end;

function TQueryFiredacModel.SQL(Value: String): iQuery;
begin

  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
  FQuery.Open;

end;

end.
