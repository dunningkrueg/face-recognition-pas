unit FaceDetector;

interface

uses
  Types, Graphics, dlib;

type
  TFaceDetector = class
  private
    FDetector: TdlibFaceDetector;
    
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure LoadModel(const AModelPath: string);
    function DetectFaces(const AImage: TBitmap): TFaceArray;
  end;

implementation

constructor TFaceDetector.Create;
begin
  inherited;
  FDetector := TdlibFaceDetector.Create;
end;

destructor TFaceDetector.Destroy;
begin
  FDetector.Free;
  inherited;
end;

procedure TFaceDetector.LoadModel(const AModelPath: string);
begin
  FDetector.LoadModel(AModelPath);
end;

function TFaceDetector.DetectFaces(const AImage: TBitmap): TFaceArray;
begin
  Result := FDetector.Detect(AImage);
end;

end. 