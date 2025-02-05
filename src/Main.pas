program FaceRecognition;

uses
  SysUtils, Classes, Graphics,
  Types,
  FaceDatabase,
  FaceRecognizer,
  FaceDetector;

type
  TFaceRecognitionSystem = class
  private
    FDetector: TFaceDetector;
    FRecognizer: TFaceRecognizer;
    FDatabase: TFaceDatabase;
    
  public
    constructor Create;
    destructor Destroy; override;
    
    function ProcessImage(const AImagePath: string): TFaceResult;
    function TrainModel(const ATrainingPath: string): Boolean;
    function RecognizeFace(const AFaceImage: TBitmap): TRecognitionResult;
  end;

var
  FaceSystem: TFaceRecognitionSystem;
  RecognitionResult: TRecognitionResult;

begin
  FaceSystem := TFaceRecognitionSystem.Create;
  try
    FaceSystem.TrainModel('training_data/');
    RecognitionResult := FaceSystem.ProcessImage('test_image.jpg');
    
    if RecognitionResult.Recognized then
      WriteLn('Person identified: ', RecognitionResult.PersonData.Name)
    else
      WriteLn('Person not recognized');
      
  finally
    FaceSystem.Free;
  end;
end. 