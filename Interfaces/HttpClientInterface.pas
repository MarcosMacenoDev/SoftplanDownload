unit HttpClientInterface;

interface

uses
  ObserverInterface;

type

  iHttpClient = interface

    ['{FB881286-039E-4516-BAB0-612DBCB70528}']
    function Download(URL: string; Observer: iObserver): iHttpClient;
    function PararDownload: iHttpClient;

  end;

implementation

end.
