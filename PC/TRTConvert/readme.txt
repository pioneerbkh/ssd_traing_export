***********************************************************************
실습 시에는 만들어진 것을 사용해주시고
현업에서는 한번 만들어서 계속 사용하면 됩니다.

sudo NV_GPU=0 nvidia-docker run --name IITPTRT0 -it -d --net=host \
 -v "/drv3/iitp1/share:/iitp_ws" \
 nvcr.io/nvidia/tensorrt:19.01-py3
************************************************************************

student@mdsdl:/drv3/iitp1/share/tod0/pbfiles$ sudo cp /drv3/tf_ssd/share/tod0/pbfiles/frozen_inference_graph.pb ./

* IITPTRT0 라는 컨테이너를 시작한다.
sudo docker restart IITPTRT0

* IITPTRT0 라는 컨테이너에 들어간다.
sudo docker exec -it IITPTRT0 /bin/bash

***********************************************************************
*run this sh srcript as soon as container start.
*최초 한번 실행
* 이미 만들어진 컨테이너에서는 실행하지 말아주십시오.
/opt/tensorrt/python/python_setup.sh
************************************************************************

2.  pb 를 UFF 컨버팅
도커 안의 tensorrt/samples/sampleUffSSD 에서 pb 를 컨버팅

cd /workspace/tensorrt/samples/sampleUffSSD

cp /iitp_ws/config.py .

 convert-to-uff --input-file /iitp_ws/tod0/pbfiles/frozen_inference_graph.pb -O NMS -p ./config.py

===> UFF Output written to /iitp_ws/tod0/pbfiles/frozen_inference_graph.uff
 
frozen_inference_graph.uff 가 생성되면 /workspace/tensorrt/data/ssd 폴더로 이동시킨 후 

frozen_inference_graph.uff -> sample_ssd_relu6.uff 로 변경한다.(mv)
# mv frozen_inference_graph.uff sample_ssd_relu6.uff

cd /workspace/tensorrt/samples/sampleUffSSD

vim sampleUffSSD.cpp

소스 49라인 수정 : threshold 값을 0.25 정도로 수정한다.  


샘플 빌드

cd /workspace/tensorrt/samples/

make

cd ../bin/
rm *.ppm
./sample_uff_ssd
