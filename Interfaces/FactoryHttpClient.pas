unit FactoryHttpClient;

interface

uses
  HttpClientInterface;

type

  iFactoryHttpClient = interface

    ['{9D86D9AE-9F6C-446A-9363-BD1CC47E613B}']
    function HttpClient: iHttpClient;

  end;

implementation

end.
