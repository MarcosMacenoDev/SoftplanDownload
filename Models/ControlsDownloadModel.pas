unit ControlsDownloadModel;

interface

uses
  VCL.StdCtrls, VCL.ComCtrls;

type

  TControlsDownload = class

  private

    FTexto: TLabel;
    FProgressBar: TProgressBar;
    FButtonExibirMensagem: TButton;
    FButtonParar: TButton;
    procedure SetTexto(const Value: TLabel);
    procedure SetProgressBar(const Value: TProgressBar);
    procedure SetButtonExibirMensagem(const Value: TButton);
    procedure SetButtonParar(const Value: TButton);

  public

    property Texto: TLabel read FTexto write SetTexto;
    property ProgressBar: TProgressBar read FProgressBar write SetProgressBar;
    property ButtonParar: TButton read FButtonParar write SetButtonParar;
    property ButtonExibirMensagem: TButton read FButtonExibirMensagem write SetButtonExibirMensagem;

  end;

implementation

{ TControlsDonwload }

procedure TControlsDownload.SetTexto(const Value: TLabel);
begin

  FTexto := Value;

end;

procedure TControlsDownload.SetButtonExibirMensagem(const Value: TButton);
begin

  FButtonExibirMensagem := Value;

end;

procedure TControlsDownload.SetButtonParar(const Value: TButton);
begin

  FButtonParar := Value;

end;

procedure TControlsDownload.SetProgressBar(const Value: TProgressBar);
begin

  FProgressBar := Value;

end;

end.
