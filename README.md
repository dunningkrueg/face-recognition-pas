# Face Recognition System in Pascal

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Version](https://img.shields.io/badge/version-1.0.0-green.svg)
![Build Status](https://img.shields.io/github/workflow/status/username/face-recognition-pascal/Build%20and%20Test)

A face recognition system implemented in Pascal, designed for educational purposes and learning computer vision concepts.

## ⚠️ Important Notice

This project is intended for **EDUCATIONAL PURPOSES ONLY**. It is not suitable for production use due to:
- Limited security features
- Incomplete error handling
- Lack of production-level testing
- Basic implementation of algorithms

## 🎯 Features

- Face detection using dlib
- Feature extraction with ResNet
- Face recognition and matching
- Basic database management
- Training system
- Multiple face detection support

## 📋 Requirements

- Free Pascal Compiler (FPC) 3.2.2 or higher
- OpenCV library
- dlib library
- ResNet model files

## 💡 Usage Example

```
pascal
var
FaceSystem: TFaceRecognitionSystem;
Result: TRecognitionResult;
begin
FaceSystem := TFaceRecognitionSystem.Create;
try
FaceSystem.TrainModel('training_data/');
Result := FaceSystem.ProcessImage('test_image.jpg');
if Result.Recognized then
WriteLn('Person identified: ', Result.PersonData.Name);
finally
FaceSystem.Free;
end;
end;
```
## 🙏 Acknowledgments

- dlib development team
- OpenCV community
- Free Pascal community
- Contributors and testers

---
Made with ❤️ for the Pascal community