docker build -t pranshuvinayak/multi-client:latest -t pranshuvinayak/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t pranshuvinayak/multi-server:latest -t pranshuvinayak/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t pranshuvinayak/multi-worker:latest -t pranshuvinayak/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push pranshuvinayak/multi-client:latest
docker push pranshuvinayak/multi-client:$SHA

docker push pranshuvinayak/multi-server:latest
docker push pranshuvinayak/multi-server:$SHA

docker push pranshuvinayak/multi-worker:latest
docker push pranshuvinayak/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployment/client-deployment client=pranshuvinayak/multi-client:$SHA
kubectl set image deployment/server-deployment server=pranshuvinayak/multi-server:$SHA
kubectl set image deployment/worker-deployment worker=pranshuvinayak/multi-worker:$SHA