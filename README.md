

# Detection of Diabetic Retinopathy With Mobile Application Using Deep Learning

  
> _Read full chapter:_ [_IGI- GLOBAL_](https://www.igi-global.com/book/diagnostic-applications-health-intelligence-surveillance/255738) _- 2020_

![Cover Photo](https://github.com/alimcevik/dr_scanner/blob/master/images/dr_scanner_turkce.jpg?raw=true)
  

## Contributors

**[**Sercan DEMİRCİ**](https://personel.omu.edu.tr/tr/sercan.demirci)**, **[**Ali Murat ÇEVİK**](https://www.linkedin.com/in/alimcevik)** , **[**İrem Türkü ÇINAR**](https://www.linkedin.com/in/iremturkucinar/)**, **[**Ceyhun TÜZÜN**](https://www.linkedin.com/in/ceyhuntuzun/)**

**Ondokuz Mayis University (OMU) - 2020
Samsun, Turkey**

  
## ****Abstract****

  
High glucose level disrupts the structure of the retinal layer in the eyes and causes diabetic retinopathy which is characterized with new pathologic blood vessels in the eyes. Although diabetic retinopathy is not clear at the beginning of the disease, it is the most common problem in people who have diabetes, and causes blindness or cloudy vision if it is not diagnosed at the beginning of the disease. For early diagnosis of diabetic retinopathy, regular fundus controls and examination of the edema in the vessels of the retina are made periodically by ophthalmologists. With in the scope of this study, it is made possible to provide the early diagnosis and the level of diabetic retinopathy by using deep learning, image processing methods and convolutional neural networks of the retina. In order to provide ease and rapid of diagnosis of the diabetic retinopathy in daily life, the diagnosis protocol has been turned into a mobile application. With the mobile application, both the diagnosis and more regular results of the diabetic retinopathy can be obtained easily and practically.

## Diabetic Retinopathy
  There are almost 415 million diabetic patients in world. It was reported that approximately 285 million of them have diabetic retinopathy, and the 40 to 45 million diabetic patients who have diabetic retinopathy are seriously threatening to see (Christian Nordqvist, 2017). In fact, diabetic retinopathy is one of the leading causes of blindness in the world (Christian Nordqvist, 2017). Therefore, ophthalmologists suggested that diabetic patients need amore frequent eye test. With the early diagnosis of diabetic retinopathy; it is possible to prevent blindness as a result of the diabetes and to improve the patient's vision. According to studies, it is predicted that patients with diabetic retinopathy will reach370 million by 2030. Although these numbers are very serious and undeniable, to parallel the studies conducted with the development of technology aim to raise the awareness of the potentially risky patients, as well as the patients who have been diagnosed, and to reduce the number of patients.

![datas](https://github.com/alimcevik/dr_scanner/blob/master/images/diabetic_retinopathy_data.jpg?raw=true)

Symptoms of diabetic retinopathy may be evident by the patient only at an advanced stage, but an ophthalmologist can detect the symptoms before reaching this stage. It is very important that diabetic patients have eye test at least twice in a year. In this way, the chances of early diagnosis and treatment of the diabetic retinopathy increase. Most commonly used methods detecting the diabetic retinopathy are expanded eye examination, fluorescein angiography (FA) and optical coherence tomography (OCT) (Clairhurts Eye Care, 2019).
## Screenshots
![ScreenShots](https://github.com/alimcevik/dr_scanner/blob/master/images/screens.jpg?raw=true)

## Dataset

  
The first of these is “healthy” with a label value of 0, and the second is “patient” with a label value of 1.

Tag Number  |Tag|
------------------------|--------------------|
0 |`Patient` |
1 |`Healthy`  |

  ## Algorithm
  ![Algorithm](https://github.com/alimcevik/dr_scanner/blob/master/images/schema.jpg?raw=true)
  ## Steps
  ![steps](https://github.com/alimcevik/dr_scanner/blob/master/images/steps.jpg?raw=true)
-   All images are cropped and resized using the resize script and pre-processing script.
    
-   Images without retinopathy were projected using the rotation script; Images with retinopathy were reflected and rotated 90, 120, 180 and 270 degrees.
    
-   After rotating and reflecting with and without retinopathy, the class imbalance has been resolved and detected several thousand images have retinopathy.
    
-   In total, there are 5000 images processed by the neural network.
    
-   All images were converted to NumPy Arrays using the conversion script. NumPy Arrays combined images and tags in an array and send the images to CNN.
    
-   The model was created by using the TensorFlow and Keras libraries. For CNN, encoding was done by using anaconda as IDE and Jupyter Notepad within anaconda.
    
-   The pictures are tagged and parsed the pictures used to train them in two different sequences according to the labelling.
    
-   The pictures were then brought to a fixed size (255*255) by grayscale method .
    
-   The images are then passed through CNN and are called learning.
    
-   The trained model can be saved and then tested with pictures.
  
## Use
![use](https://github.com/alimcevik/dr_scanner/blob/master/images/diabetic_retinopathy.jpg?raw=true)
    
The specially designed interface is as shown above so that all users of all ages can work easily. Simplicity is preferred in UI design to facilitate usage and provide practicality in the interface where minimal perspective is prioritized. The usage scenario of the mobile application with 20D credit details is given in the figure.

## Setup

- Open ****drscanner**** file with ****Visual Studio Code****

- Run this command on the terminal `flutter pub get`

- And finally `flutter run`

  

  

## More Info

- Flutter Documentation [Flutter.dev](https://flutter.dev/docs/)
- TFLite Documentation [TensorFlow Lite](https://www.tensorflow.org/lite)

##  MIT LICENSE
[MIT LICENSE](https://github.com/alimcevik/dr_scanner/blob/master/LICENSE)

