unit FaceRecognizer;

interface

uses
  Types, Graphics, dlib;

type
  TFaceRecognizer = class
  private
    FNetwork: TDNNNetwork;
    
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure LoadNetwork(const AModelPath: string);
    function ExtractFeatures(const AImage: TBitmap; const AFace: TRect = nil): TFeatureArray;
    procedure UpdateModel;
  end;

implementation

constructor TFaceRecognizer.Create;
begin
  inherited;
  FNetwork := TDNNNetwork.Create;
end;

destructor TFaceRecognizer.Destroy;
begin
  FNetwork.Free;
  inherited;
end;

procedure TFaceRecognizer.LoadNetwork(const AModelPath: string);
begin
  FNetwork.LoadFromFile(AModelPath);
end;

function TFaceRecognizer.ExtractFeatures(const AImage: TBitmap; const AFace: TRect): TFeatureArray;
var
  ProcessedImage: TBitmap;
begin
  ProcessedImage := PreprocessImage(AImage, AFace);
  try
    Result := FNetwork.Forward(ProcessedImage);
  finally
    ProcessedImage.Free;
  end;
end;

procedure TFaceRecognizer.UpdateModel;
begin
  FNetwork.UpdateWeights;
end;

end. 