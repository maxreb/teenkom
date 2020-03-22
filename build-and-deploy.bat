@echo off
setlocal



docker build -t caiju/tk3 -t hse-server01:5000/caiju/tk3 -f Caiju.TeenKom.TK3/Dockerfile .
docker build -t caiju/appserver -t hse-server01:5000/caiju/appserver -f Caiju.TeenKom.Blitzjob.AppServer/Dockerfile .

docker push hse-server01:5000/caiju/appserver
docker push hse-server01:5000/caiju/tk3
pause