unit ObserverInterface;

interface

type

  iObserver = interface

    ['{68BB5B3C-F0DA-4A29-88CB-FEC461DF947E}']
    function Update(ContentLength, PercDownloaded: Int64): iObserver;

  end;

  iSubject = interface

    ['{0F257646-7092-46D5-A146-21F34037C640}']

    //property ContentLength: Int64 read FContentLength write FContentLength;
    //property PercDownloaded: Int64 read FPercDownloaded write FPercDownloaded;
    function AddObserver(Value: iObserver): iSubject;
    function RemoveObserver(Value: iObserver): iSubject;
    function Notify(ContentLength, PercDownloaded: Int64): iSubject;

  end;

implementation


end.
