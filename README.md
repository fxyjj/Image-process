# Imgae-process

#the question specification showed in CW_20190328.pdf file
there are three separate tasks for this CW
-task1 is to implement a face detector, 
-task2 is to implement several common image process filters and use the impelemted filters to deal with some noisy picture
-task3 is a difficult part that to distract the vessal part from the retina picture


#task1
relative files

-training_face_image file which store the trainning face picture i collected from the internet.

-getFaceModel.m file is to use the trianing face image to generate a cluster set which is used to detect the face region

-getBinarizedFaceImage.m file is to translate the gray image to binary image which have only pixal value of 1 or 0

-getMorphFace.m file generate the result of single picture

-task1main.m file is the solution of the task1, run it in matlab then the face region in face1.jpg and face2.jpg will be peerfrom in white color and the other place will be black(some noise in the detection result of face2.jpg).

-dilation.m file implemented the operation of dilation (reduce the noise)

-erosion.m file implemented the operation of erosion (make the region clearer)

-connection_comp.m implemented the connection components operation.

#task2
relative files

-Anisotropic.m file is the implementation of Anisotropic filter 

-BF.m file is the implementation of Bilateral filter

-G_filter.m is the implementation of Guassian filter

-meidianFilter.m is the implementation of Meidian Filter

-task2.m is the result of task2, when run it in matlab, the performance just satisfied the requirements of task2

#task3
relative files

-laplacian.m file is the implementation of the laplacian filter 

-DoG.m file implemented the differentiate of guaissian filter 

-loG.m file try on the laplacian of guassian filter

-sobel.m file is the implementation of sobel operation

-Canny.m file is the implementation of Canny filter

-Otsu.m file is the implementation of otsu thresholding 

-tast6.m is the test file for task3, task3 is now no finished yet.














