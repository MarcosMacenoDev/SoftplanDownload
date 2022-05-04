unit ConexaoFiredacModel;

interface

uses
  ConexaoInterface, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.DB;

type

  TConexaoFiredacModel = class(TInterfacedObject, iConexao)

  private

    //FConexao: TFDConnection;
    constructor Create(Database: String);

  public

    destructor Destroy; override;
    function Connection: TCustomConnection;
    class function New(DataBase: String): iConexao;

  end;

var
  FConexao: TFDConnection;

implementation

uses
  System.SysUtils;

{ TConexaoFiredacModel }

function TConexaoFiredacModel.Connection: TCustomConnection;
begin

  Result := FConexao;

end;

constructor TConexaoFiredacModel.Create(Database: String);
begin

  if (FConexao = nil) then
  begin

    FConexao := TFDConnection.Create(nil);
    FConexao.DriverName := 'SQLite';
    FConexao.LoginPrompt := False;
    FConexao.Params.Database := Database;

  end;

end;

destructor TConexaoFiredacModel.Destroy;
begin

  FreeAndNil(FConexao);
  inherited;

end;

class function TConexaoFiredacModel.New(DataBase: String): iConexao;
begin

  Result := Self.Create(DataBase);

end;

end.
