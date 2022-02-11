docker build -t stefaniadicu/multi-client -t stefaniadicu/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t stefaniadicu/multi-server -t stefaniadicu/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t stefaniadicu/multi-worker -t stefaniadicu/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push stefaniadicu/multi-client:latest
docker push stefaniadicu/multi-client:$GIT_SHA
docker push stefaniadicu/multi-server:latest
docker push stefaniadicu/multi-server:$GIT_SHA
docker push stefaniadicu/multi-worker:latest
docker push stefaniadicu/multi-worker:$GIT_SHA

kubectl apply -f ./k8s
kubectl set image deployments/server-deployment server=stefaniadicu/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=stefaniadicu/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=stefaniadicu/multi-worker:$GIT_SHA