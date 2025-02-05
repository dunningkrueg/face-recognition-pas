unit Types;

interface

type
  TFeatureArray = array of Double;
  TFaceArray = array of TRect;
  
  TPersonData = record
    ID: Integer;
    Name: string;
    Features: TFeatureArray;
  end;
  
  TRecognitionResult = record
    Recognized: Boolean;
    PersonData: TPersonData;
    Confidence: Double;
  end;
  
  TFaceResult = class
    Features: TFeatureArray;
    procedure Add(const AFeatures: TFeatureArray);
  end;

implementation

procedure TFaceResult.Add(const AFeatures: TFeatureArray);
begin
  Features := AFeatures;
end;

end. 