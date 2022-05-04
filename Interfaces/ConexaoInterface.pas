unit ConexaoInterface;

interface

uses
  Data.DB;

type

  iConexao = interface

    ['{3B56B7C7-56F0-4D33-82B7-5B775CFEDA27}']
    function Connection: TCustomConnection;

  end;

implementation

end.
