function appendDatatoList(list) {
    var a = Date.now()
    console.log(a)

    var xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function() {

        if (xhr.readyState === XMLHttpRequest.DONE) {

            var json = JSON.parse(xhr.responseText.toString())

            var arr = []

            Object.keys(json).forEach(function(k) {

                var name = json[k].series_title

                if (arr.indexOf(name) < 0) {
                    arr.push(json[k].series_title)
                }
            })

            arr.sort()

            arr.forEach(function(e) {
                list.append({name: e})
            })
        }
    }

    xhr.open("GET", "http://localhost:3300")
    xhr.send()
}



function nextFocus(a, b, c) {
    if (a.focus === true) {
        a.focus = false
        b.focus = true
    }
    else if (b.focus === true) {
        b.focus = false
        c.focus = true
    }
}




function prevFocus(a, b, c) {
    if (c.focus === true) {
        c.focus = false
        b.focus = true
    }
    else if (b.focus === true) {
        a.focus = true
        b.focus = false
    }
}
