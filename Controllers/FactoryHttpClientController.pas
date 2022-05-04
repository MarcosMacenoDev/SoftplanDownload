unit FactoryHttpClientController;

interface

uses
  HttpClientInterface, FactoryHttpClient;

type

  TFactoryHttpClientController = class (TInterfacedObject, iFactoryHttpClient)

  public

    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryHttpClient;
    function HttpClient: iHttpClient;

  end;

implementation

{ TFactoryHttpClientController }

uses HttpClientNetModel;

constructor TFactoryHttpClientController.Create;
begin

end;

destructor TFactoryHttpClientController.Destroy;
begin

  inherited;

end;

class function TFactoryHttpClientController.New: iFactoryHttpClient;
begin

  Result := Self.Create;

end;

function TFactoryHttpClientController.HttpClient: iHttpClient;
begin

  Result := THttpClientNet.New;

end;

end.
