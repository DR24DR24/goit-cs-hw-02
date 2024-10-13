#!/user/bin/bash
echo "hello"
of="website_status.log"
echo "Log file: $of"
> "$of"
sites=()
sites+=("https://google.com")
sites+=("https://facebook.com")
sites+=("https://twitter.com")
for item in "${sites[@]}" ; do
	echo -n "<$item> " | tee -a "$of" 
        sitestatus=$(curl -o /dev/null -s -w  "%{http_code}" $item)
        echo -n	"status code:  $sitestatus "

	if [ "$sitestatus" -eq 200 ];then 
		res="UP"
	else
		res="DOWN"
      	fi
        echo $res | tee -a "$of"
	
done
