NAME=`docker run -d -p 80:80 -m 512m --cpu-period=50000 --cpu-quota=5000 tools`
sleep 5
while((1));do
	sleep 1
	OK=NOT
	OK=`curl -m 1 'http://localhost/python?run=print(%22OK%22)' 2>/dev/null`OK
	if [ $OK != OKOK ] ; then
		docker kill $NAME &
		NAME=`docker run -d -p 80:80 -m 512m --cpu-period=50000 --cpu-quota=5000 tools`
		sleep 5
	fi
done;
