var ws, cmd = "";
var input=document.getElementById("txtInput");
var output=document.getElementById("txtOutput");

function connect(){
    if ("WebSocket" in window) {
        ws = new WebSocket("ws://localhost:5001/");
        output.value="connecting...";
        /* ws.onopen=function(e){output.innerHTML="connected"}; */
        ws.onclose=function(e){output.innerHTML="disconnected"};
        ws.onerror=function(e){output.value=e.data};
        /*
            when a message is received,
            prepend the message to the display area
            along with the input command
        */
        ws.onmessage=function(e){
        /*parse the JSON string into a JSON object using JSON.parse */
            var outputHTML,data = JSON.parse(e.data);
            if (typeof data == "object") {
                /* if an object, then message must be a table or a dictionary */
                if (data.length) {
                    /*if object has a length then it is a table*/
                    outputHTML = generateTableHTML(data);
                } else {
                    /*
                    if object has no length, it is a dictionary,
                    in this case we will iterate over the keys to print
                    the key|value pairs as would be displayed in a q console
                    */
                    for (var x in data)
                        outputHTML +=  x + " | " + data[x] + "<br />";
                    }
                }else {
                /* if not an object, then message must have simple data structure*/
            outputHTML = data;
            };
            output.innerHTML = "<div style='text-align:right;'><p  margin-top='0.25em' margin-bottom='0.25em' style='background-color:lightblue; display:inline; padding:5px; border-radius:4px;' >" + cmd + "</p></div>" + outputHTML + "<hr color='#000000' size='1px'>" + "<br />" + output.innerHTML;
            }
        } else alert("WebSockets not supported on your browser.");
    }

 input.addEventListener("keyup", function(event) {
   if (event.keyCode === 13) {
    event.preventDefault();
    send();
   }
 });


function send(){
    /*
        store the input command so that we can access it later
        to print in with the response
    */
    cmd = input.value + "<br/>";
    /* send the input command across the WebSocket connection */
    ws.send(input.value);
    /*
        reset the input test box to empty, and
        focus the cursor back on it ready for the next input
    */
    input.value="";
    input.focus();
}

function generateTableHTML(data){
    /* we will iterate through the object wrapping it in the HTML table tags */
    var tableHTML = '<table border="1" bordercolor="#000000" bgcolor="F5FDFF" cellpadding="3px"><tr>';
    for (var x in data[0]) {
        /* loop through the keys to create the table headers */
        tableHTML += '<th>' + x + '</th>';
    }
    tableHTML += '</tr>';
    for (var i = 0; i < data.length; i++) {
        /* loop through the rows, putting tags around each col value */
        tableHTML += '<tr>';
        for (var x in data[0]) {
            tableHTML += '<td>' + data[i][x] + '</td>';
        }
        tableHTML += '</tr>';
    }
    tableHTML += '</table>';
    return tableHTML;
}

connect(); //call the connect function
