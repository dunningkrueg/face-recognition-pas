unit FaceDatabase;

interface

uses
  Types, SysUtils, Classes;

type
  TFaceDatabase = class
  private
    FPersons: array of TPersonData;
    
  public
    procedure AddPerson(const APersonData: TPersonData);
    function FindBestMatch(const AFeatures: TFeatureArray; out ASimilarity: Double): TPersonData;
    procedure SaveToFile(const AFileName: string);
    procedure LoadFromFile(const AFileName: string);
  end;

implementation

procedure TFaceDatabase.AddPerson(const APersonData: TPersonData);
begin
  SetLength(FPersons, Length(FPersons) + 1);
  FPersons[High(FPersons)] := APersonData;
end;

function TFaceDatabase.FindBestMatch(const AFeatures: TFeatureArray; out ASimilarity: Double): TPersonData;
var
  I: Integer;
  CurrentSimilarity: Double;
begin
  ASimilarity := 0;
  
  for I := 0 to High(FPersons) do begin
    CurrentSimilarity := CalculateSimilarity(AFeatures, FPersons[I].Features);
    if CurrentSimilarity > ASimilarity then begin
      ASimilarity := CurrentSimilarity;
      Result := FPersons[I];
    end;
  end;
end;

procedure TFaceDatabase.SaveToFile(const AFileName: string);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(AFileName, fmCreate);
  try
    Stream.WriteBuffer(FPersons[0], Length(FPersons) * SizeOf(TPersonData));
  finally
    Stream.Free;
  end;
end;

procedure TFaceDatabase.LoadFromFile(const AFileName: string);
var
  Stream: TFileStream;
  FileSize: Integer;
begin
  Stream := TFileStream.Create(AFileName, fmOpenRead);
  try
    FileSize := Stream.Size div SizeOf(TPersonData);
    SetLength(FPersons, FileSize);
    Stream.ReadBuffer(FPersons[0], Stream.Size);
  finally
    Stream.Free;
  end;
end;

end. 