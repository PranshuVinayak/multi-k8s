docker build -t pranshuvinayak/multi-client -f ./client/Dockerfile ./client
docker build -t pranshuvinayak/multi-server -f ./server/Dockerfile ./server
docker build -t pranshuvinayak/multi-worker -f ./worker/Dockerfile ./worker
docker push pranshuvinayak/multi-client
docker push pranshuvinayak/multi-server
docker push pranshuvinayak/multi-worker
kubectl apply -f k8s
kubectl set image deployment/server-deployment server=pranshuvinayak/multi-server