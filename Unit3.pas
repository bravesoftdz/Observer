unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TSubjectObserver = class;

  TSubject = class(TObject)
  private
    FObservers: TList;

  public
    procedure Change;

    procedure RegisterObserver(Observer: TSubjectObserver);
    procedure UnregisterObserver(Observer: TSubjectObserver);
    constructor create;
  end;

  TSubjectObserver = class(TComponent)
  private
    FOnChange: integer;
    //FEnabled: Boolean;
  protected
    procedure Change;
  published
    constructor create;
    property OnChange: integer read FOnChange write FOnChange;
  end;

implementation

{ TSubject }

procedure TSubject.Change;
var
  Obs: TSubjectObserver;
  I: Integer;
begin
  for I := 0 to FObservers.Count - 1 do
  begin
    Obs := FObservers[I];
    Obs.Change;
    //Obs.e
  end;
end;

constructor TSubject.create;
begin
  FObservers := TList.Create;
end;

procedure TSubject.RegisterObserver(Observer: TSubjectObserver);
begin

  FObservers.Add(Observer);
end;

procedure TSubject.UnregisterObserver(Observer: TSubjectObserver);
begin
  FObservers.Remove(Observer);
end;

{ TSubjectObserver }

procedure TSubjectObserver.Change;
begin
    OnChange:=OnChange+1;
end;

constructor TSubjectObserver.create;
begin
  OnChange:=0;
end;

end.
