var ws, cmd = "";
var input=document.getElementById("txtInput");
var output=document.getElementById("txtOutput");

// Submit on enter key
input.addEventListener("keyup", function(event) {
   if (event.keyCode === 13) {
    event.preventDefault();
    send();
   }
 });

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
            output.innerHTML = "<div style='text-align:right;'><p  margin-top='0.25em' margin-bottom='0.25em' style='color:white; background-color:#00008B; display:inline; padding:5px; border-radius:4px; font-family: Verdana; font-size:13px;' >" + cmd + "</p></div>" + "<div style='width:75%;'><p margin-top='0.25em' margin-bottom='0.25em' style='color:black; background-color:#E6E6FA; display:inline; padding:8px; border-radius:6px; font-family: Verdana; font-size:13px;'>" + outputHTML + "</p></div>"+ "<hr color='#000000' size='1px'>" + "<br />" + output.innerHTML;
            }
        } else alert("WebSockets not supported on your browser.");
    }

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
    var row=[];
    var csv=[];
    var tableHTML = '<table border="1" bordercolor="#000000" bgcolor="F5FDFF" cellpadding="3px"><tr>';
    for (var x in data[0]) {
        /* loop through the keys to create the table headers */
        tableHTML += '<th>' + x + '</th>';
        row.push(x);
    }
    tableHTML += '</tr>';
        csv.push("\n");
        csv.push(row.join());
        csv.push("\n");
        var row=[];
    for (var i = 0; i < data.length; i++) {
        /* loop through the rows, putting tags around each col value */
        if(i<5){
            tableHTML += '<tr>';
        }
        for (var x in data[0]) {
            if(i<5){
                tableHTML += '<td>' + data[i][x] + '</td>';
            }
            row.push(data[i][x]);
        }
        csv.push(row.join());
        csv.push("\n");
        var row=[];
        if(i<5){
            tableHTML += '</tr>';
        }
    }
    tableHTML += '</table>';
//    downloadCSV(csv, "data");
    return tableHTML;
}

function downloadCSV(csv, filename) {
    var csvFile;
    var downloadLink;

    // CSV file
    csvFile = new Blob([csv], {type: "text/csv"});

    // Download link
    downloadLink = document.createElement("a");

    // File name
    downloadLink.download = filename;

    // Create a link to the file
    downloadLink.href = window.URL.createObjectURL(csvFile);

    // Hide download link
    downloadLink.style.display = "none";

    // Add the link to DOM
    document.body.appendChild(downloadLink);

    // Click download link
    downloadLink.click();
}


window.onbeforeunload = function(event) {
    event.returnValue = "";
};


//function exportTableToCSV(filename) {
//    var csv = [];
//    var rows = document.querySelectorAll("table tr");
//
//    for (var i = 0; i < rows.length; i++) {
//        var row = [], cols = rows[i].querySelectorAll("td, th");
//
//        for (var j = 0; j < cols.length; j++)
//            row.push(cols[j].innerText);
//
//        csv.push(row.join(","));
//    }
//
//    // Download CSV file
//    downloadCSV(csv.join("\n"), filename);
//}

connect(); //call the connect function


